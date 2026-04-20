# Improvado Technical Assignment

Cross-channel marketing analytics: unifying Facebook, Google and TikTok advertising data.

## Deliverables

| Deliverable | Link |
|-------------|------|
| Live Dashboard | [Tableau Public](https://public.tableau.com/views/Improvado_17766528231820/ImprovadoDashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) |
| Video Walkthrough | [Loom](https://www.loom.com/share/6dd5b87f07f448e3bba6c3ddc2103f35) |

## Architecture
Raw CSVs → Staging Tables → Unified Model → Tableau

**Database:** Neon PostgreSQL

| Layer | Tables | Rows |
|-------|--------|------|
| Staging | stg_facebook_ads, stg_google_ads, stg_tiktok_ads | 110 each |
| Unified | fct_ads_performance | 330 |

## Data Model

Normalized fields across platforms:

| Unified Field | Facebook | Google | TikTok |
|---------------|----------|--------|--------|
| ad_group_id | ad_set_id | ad_group_id | adgroup_id |
| ad_group_name | ad_set_name | ad_group_name | adgroup_name |
| spend | spend | cost | cost |
| video_views | video_views | NULL | video_views |

## Setup

```bash
# Install dependencies
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Configure database
cp .env.example .env
# Edit .env with your Neon connection string

# Run scripts in order
# 1. Execute sql/01_create_staging_tables.sql in Neon
# 2. python sql/02_load_data.py
# 3. Execute sql/03_create_unified_model.sql in Neon
```

## Project Structure
```
├── data/                 # Source CSVs
├── sql/
│   ├── 01_create_staging_tables.sql
│   ├── 02_load_data.py
│   └── 03_create_unified_model.sql
├── .env.example
└── requirements.txt
```