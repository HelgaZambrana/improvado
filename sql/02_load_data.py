import os
import psycopg2
from pathlib import Path

# Load environment variables from .env
from dotenv import load_dotenv
load_dotenv()

# Paths
DATA_DIR = Path(__file__).parent.parent / "data"
DATABASE_URL = os.getenv("DATABASE_URL")

# Mapping: file to (table, columns)
TABLES = {
    "01_facebook_ads.csv": (
        "marketing.stg_facebook_ads",
        "date, campaign_id, campaign_name, ad_set_id, ad_set_name, impressions, clicks, spend, conversions, video_views, engagement_rate, reach, frequency"
    ),
    "02_google_ads.csv": (
        "marketing.stg_google_ads",
        "date, campaign_id, campaign_name, ad_group_id, ad_group_name, impressions, clicks, cost, conversions, conversion_value, ctr, avg_cpc, quality_score, search_impression_share"
    ),
    "03_tiktok_ads.csv": (
        "marketing.stg_tiktok_ads",
        "date, campaign_id, campaign_name, adgroup_id, adgroup_name, impressions, clicks, cost, conversions, video_views, video_watch_25, video_watch_50, video_watch_75, video_watch_100, likes, shares, comments"
    )
}

# Connect
conn = psycopg2.connect(DATABASE_URL)

# Load each CSV
for filename, (table, columns) in TABLES.items():
    with open(DATA_DIR / filename, 'r') as f:
        next(f) # to skip header
        with conn.cursor() as cur:
            cur.execute(f"TRUNCATE TABLE {table}")
            cur.copy_expert(f"COPY {table} ({columns}) FROM STDIN WITH CSV", f)
    conn.commit()
    print(f"{filename} loaded")

conn.close()
print("Done")