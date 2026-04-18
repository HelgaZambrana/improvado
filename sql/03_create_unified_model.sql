DROP TABLE IF EXISTS marketing.fct_ads_performance;

CREATE TABLE marketing.fct_ads_performance AS

-- Facebook Ads
SELECT 
    date,
    'facebook' AS platform,
    campaign_id,
    campaign_name,
    ad_set_id AS ad_group_id,
    ad_set_name AS ad_group_name,
    impressions,
    clicks,
    spend,
    conversions,
    video_views

FROM marketing.stg_facebook_ads

UNION ALL

-- Google Ads
SELECT 
    date,
    'google' AS platform,
    campaign_id,
    campaign_name,
    ad_group_id,
    ad_group_name,
    impressions,
    clicks,
    cost AS spend,
    conversions,
    NULL AS video_views

FROM marketing.stg_google_ads

UNION ALL

-- TikTok Ads
SELECT 
    date,
    'tiktok' AS platform,
    campaign_id,
    campaign_name,
    adgroup_id AS ad_group_id, -- Normalize naming (no underscore)
    adgroup_name AS ad_group_name, -- Normalize naming (no underscore)
    impressions,
    clicks,
    cost AS spend, -- Rename to 'spend'
    conversions,
    video_views

FROM marketing.stg_tiktok_ads;