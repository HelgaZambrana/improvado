-- Create schema for organizing marketing tables
CREATE SCHEMA IF NOT EXISTS marketing;


-- Facebook Ads Staging Table
DROP TABLE IF EXISTS marketing.stg_facebook_ads;

CREATE TABLE marketing.stg_facebook_ads (
    date                DATE NOT NULL,
    campaign_id         VARCHAR(50) NOT NULL,
    campaign_name       VARCHAR(255),
    ad_set_id           VARCHAR(50) NOT NULL,
    ad_set_name         VARCHAR(255),
    impressions         INTEGER,
    clicks              INTEGER,
    spend               DECIMAL(10,2),
    conversions         INTEGER,
    video_views         INTEGER,
    engagement_rate     DECIMAL(10,4),
    reach               INTEGER,
    frequency           DECIMAL(5,2)
);


-- Google Ads Staging Table
DROP TABLE IF EXISTS marketing.stg_google_ads;

CREATE TABLE marketing.stg_google_ads (
    date                    DATE NOT NULL,
    campaign_id             VARCHAR(50) NOT NULL,
    campaign_name           VARCHAR(255),
    ad_group_id             VARCHAR(50) NOT NULL,
    ad_group_name           VARCHAR(255),
    impressions             INTEGER,
    clicks                  INTEGER,
    cost                    DECIMAL(10,2),
    conversions             INTEGER,
    conversion_value        DECIMAL(12,2),
    ctr                     DECIMAL(10,4),
    avg_cpc                 DECIMAL(10,2),
    quality_score           INTEGER,
    search_impression_share DECIMAL(5,2)
);


-- TikTok Ads Staging Table
DROP TABLE IF EXISTS marketing.stg_tiktok_ads;

CREATE TABLE marketing.stg_tiktok_ads (
    date                DATE NOT NULL,
    campaign_id         VARCHAR(50) NOT NULL,
    campaign_name       VARCHAR(255),
    adgroup_id          VARCHAR(50) NOT NULL,
    adgroup_name        VARCHAR(255),
    impressions         INTEGER,
    clicks              INTEGER,
    cost                DECIMAL(10,2),
    conversions         INTEGER,
    video_views         INTEGER,
    video_watch_25      INTEGER,
    video_watch_50      INTEGER,
    video_watch_75      INTEGER,
    video_watch_100     INTEGER,
    likes               INTEGER,
    shares              INTEGER,
    comments            INTEGER
);