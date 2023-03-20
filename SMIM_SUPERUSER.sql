purge recyclebin;
SET SERVEROUTPUT on;

DECLARE

BEGIN
  EXECUTE IMMEDIATE 'DROP ROLE APP_ADMIN';
  EXECUTE IMMEDIATE 'DROP ROLE CAMPAIGN_MANAGER';
  EXECUTE IMMEDIATE 'DROP ROLE INFLUENCER';
  
  EXCEPTION
   WHEN OTHERS THEN
   IF SQLCODE != -1918
   THEN RAISE;
   END IF;
END;
/

CREATE role APP_ADMIN;
CREATE role CAMPAIGN_MANAGER;
CREATE role INFLUENCER;

DECLARE
   brand_table_count number;
   influencer_table_count number;
   skill_table_count number;
   influencer_skill_table_count number;
   social_media_platform_table_count number;
   social_media_account_table_count number;
   campaign_table_count number;
   campaign_post_table_count number;
   post_engagement_table_count number;
   campaign_performance_table_count number;
BEGIN
  select count(*)
  into brand_table_count from user_tables
  where table_name = 'BRAND';
  
  select count(*)
  into influencer_table_count from user_tables
  where table_name = 'INFLUENCER';
  
  select count(*)
  into skill_table_count from user_tables
  where table_name = 'SKILL';
  
  select count(*)
  into influencer_skill_table_count from user_tables
  where table_name = 'INFLUENCER_SKILL';
  
  select count(*)
  into social_media_platform_table_count from user_tables
  where table_name = 'SOCIAL_MEDIA_PLATFORM';
  
  select count(*)
  into social_media_account_table_count from user_tables
  where table_name = 'SOCIAL_MEDIA_ACCOUNT';
  
  select count(*)
  into campaign_table_count from user_tables
  where table_name = 'CAMPAIGN';
  
  select count(*)
  into campaign_post_table_count from user_tables
  where table_name = 'CAMPAIGN_POST';
  
  select count(*)
  into post_engagement_table_count from user_tables
  where table_name = 'POST_ENGAGEMENT';
  
  select count(*)
  into campaign_performance_table_count from user_tables
  where table_name = 'CAMPAIGN_PERFORMANCE';
  
  
  if(campaign_performance_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE CAMPAIGN_PERFORMANCE'; END IF;
  
  if(post_engagement_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE POST_ENGAGEMENT'; END IF;
  
  if(campaign_post_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE CAMPAIGN_POST'; END IF;
  
  if(campaign_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE CAMPAIGN'; END IF;
  
  if(social_media_account_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE SOCIAL_MEDIA_ACCOUNT'; END IF;
  
  if(influencer_skill_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE INFLUENCER_SKILL'; END IF;
  
  if(brand_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE BRAND'; END IF;
  
  if(influencer_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE INFLUENCER'; END IF;
  
  if(skill_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE SKILL'; END IF;
  
  if(social_media_platform_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE SOCIAL_MEDIA_PLATFORM'; END IF;
  
END;
/

CREATE TABLE brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(30) NOT NULL,
    contact_person varchar(30) NOT NULL,
    brand_location varchar(30) NOT NULL,
    website varchar(30) NOT NULL UNIQUE,
    email varchar(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE influencer (
    influencer_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    influencer_location varchar(30) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    phone varchar(255) NOT NULL,
    gender varchar(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE skill (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(30) NOT NULL,
    skill_description varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE influencer_skill (
    skill_id INT NOT NULL REFERENCES skill,
    influncer_id INT NOT NULL REFERENCES influencer,
    constraint infsk_pk PRIMARY KEY(skill_id, influncer_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE social_media_platform (
    platform_id INT PRIMARY KEY,
    platform_name VARCHAR(30) NOT NULL,
    platform_website varchar(30) NOT NULL UNIQUE,
    platform_description varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE social_media_account (
    social_media_account_id INT PRIMARY KEY,
    platform_id INT NOT NULL REFERENCES social_media_platform,
    influncer_id INT NOT NULL REFERENCES influencer,
    account_handle VARCHAR(30) NOT NULL UNIQUE,
    account_url VARCHAR(100) NOT NULL UNIQUE,
    followers INT NOT NULL,
    bio varchar(255),
    verified VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE campaign (
    campaign_id INT PRIMARY KEY,
    brand_id INT NOT NULL REFERENCES brand,
    campaign_name VARCHAR(30) NOT NULL,
    campaign_objective varchar(255) NOT NULL,
    target_audience varchar(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT date_validation CHECK(TO_CHAR(start_date, 'YYYY-MM-DD') < TO_CHAR(end_date, 'YYYY-MM-DD')),
    budget INT NOT NULL,
    campaign_priority INT NOT NULL,
    CONSTRAINT campaign_priority_validation CHECK(campaign_priority<4 AND campaign_priority>0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE campaign_post (
    post_id INT PRIMARY KEY,
    campaign_id INT NOT NULL REFERENCES campaign,
    social_media_account_id INT NOT NULL REFERENCES social_media_account,
    post_caption VARCHAR(255) NOT NULL,
    post_image VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE post_engagement (
    post_id INT NOT NULL REFERENCES campaign_post,
    likes INT NOT NULL,
    shares INT NOT NULL,
    comments INT NOT NULL,
    views INT NOT NULL,
    reach INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unq_eng UNIQUE (post_id)
);

CREATE TABLE campaign_performance (
    campaign_performance_id INT PRIMARY KEY,
    influencer_id INT NOT NULL REFERENCES influencer,
    campaign_id INT NOT NULL REFERENCES campaign,
    clicks INT NOT NULL,
    impressions INT NOT NULL,
    engagement INT NOT NULL,
    posts_count INT NOT NULL,
    reach INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

