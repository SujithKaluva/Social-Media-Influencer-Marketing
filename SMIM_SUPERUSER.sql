purge recyclebin;
SET SERVEROUTPUT on;

DECLARE
   brand_table_count number;
   brand_seq_count number;
   influencer_table_count number;
   influencer_seq_count number;
   skill_table_count number;
   skill_seq_count number;
   influencer_skill_table_count number;
   social_media_platform_table_count number;
   social_media_platform_seq_count number;
   social_media_account_table_count number;
   social_media_account_seq_count number;
   campaign_table_count number;
   campaign_seq_count number;
   campaign_post_table_count number;
   campaign_post_seq_count number;
   post_engagement_table_count number;
   campaign_performance_table_count number;
   campaign_performance_seq_count number;
BEGIN

  -- tables
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

  --   Sequences

  select count(*)
  into brand_seq_count from user_sequences
  where sequence_name = 'BRAND_ID_SEQ';
  
  select count(*)
  into influencer_seq_count from user_sequences
  where sequence_name = 'INFLUENCER_ID_SEQ';
  
  select count(*)
  into skill_seq_count from user_sequences
  where sequence_name = 'SKILL_ID_SEQ';
  
  select count(*)
  into social_media_platform_seq_count from user_sequences
  where sequence_name = 'PLATFORM_ID_SEQ';
  
  select count(*)
  into social_media_account_seq_count from user_sequences
  where sequence_name = 'SOCIAL_MEDIA_ACCOUNT_ID_SEQ';
  
  select count(*)
  into campaign_seq_count from user_sequences
  where sequence_name = 'CAMPAIGN_ID_SEQ';
  
  select count(*)
  into campaign_post_seq_count from user_sequences
  where sequence_name = 'POST_ID_SEQ';
  
  select count(*)
  into campaign_performance_seq_count from user_sequences
  where sequence_name = 'CAMPAIGN_PERFORMANCE_ID_SEQ';
  
  -- tables

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

  --sequences

  if(brand_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE BRAND_ID_SEQ'; END IF;

  if(influencer_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE INFLUENCER_ID_SEQ'; END IF;

  if(skill_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE SKILL_ID_SEQ'; END IF;

  if(social_media_platform_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE PLATFORM_ID_SEQ'; END IF;

  if(social_media_account_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE SOCIAL_MEDIA_ACCOUNT_ID_SEQ'; END IF;

  if(campaign_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE CAMPAIGN_ID_SEQ'; END IF;
  
  if(campaign_post_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE POST_ID_SEQ'; END IF;

  if(campaign_performance_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE CAMPAIGN_PERFORMANCE_ID_SEQ'; END IF;
  
END;
/

CREATE TABLE brand (
    brand_id NUMBER PRIMARY KEY,
    brand_name VARCHAR(30) NOT NULL,
    contact_person varchar(30) NOT NULL,
    brand_location varchar(30) NOT NULL,
    website varchar(30) NOT NULL UNIQUE,
    email varchar(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT email_check CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

CREATE TABLE influencer (
    influencer_id NUMBER PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    influencer_location varchar(30) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    phone varchar(255) NOT NULL,
    gender varchar(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT email_check_two CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

CREATE TABLE skill (
    skill_id NUMBER PRIMARY KEY,
    skill_name VARCHAR(30) NOT NULL,
    skill_description varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE influencer_skill (
    skill_id NUMBER NOT NULL REFERENCES skill,
    influencer_id NUMBER NOT NULL REFERENCES influencer,
    constraint infsk_pk PRIMARY KEY(skill_id, influencer_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE social_media_platform (
    platform_id NUMBER PRIMARY KEY,
    platform_name VARCHAR(30) NOT NULL,
    platform_website varchar(30) NOT NULL UNIQUE,
    platform_description varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE social_media_account (
    social_media_account_id NUMBER PRIMARY KEY,
    platform_id NUMBER NOT NULL REFERENCES social_media_platform,
    influncer_id NUMBER NOT NULL REFERENCES influencer,
    account_handle VARCHAR(30) NOT NULL,
    account_url VARCHAR(100) NOT NULL UNIQUE,
    followers NUMBER NOT NULL,
    bio varchar(255),
    verified VARCHAR(30) NOT NULL,
    CONSTRAINT unique_account_handle_per_platform UNIQUE (platform_id, account_handle),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE campaign (
    campaign_id NUMBER PRIMARY KEY,
    brand_id NUMBER NOT NULL REFERENCES brand,
    campaign_name VARCHAR(30) NOT NULL,
    campaign_objective varchar(255) NOT NULL,
    target_audience varchar(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT date_validation CHECK(TO_CHAR(start_date, 'YYYY-MM-DD') < TO_CHAR(end_date, 'YYYY-MM-DD')),
    budget NUMBER NOT NULL,
    campaign_priority NUMBER NOT NULL,
    CONSTRAINT campaign_priority_validation CHECK(campaign_priority<4 AND campaign_priority>0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE campaign_post (
    post_id NUMBER PRIMARY KEY,
    campaign_id NUMBER NOT NULL REFERENCES campaign,
    social_media_account_id NUMBER NOT NULL REFERENCES social_media_account,
    post_caption VARCHAR(255) NOT NULL,
    post_image VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE post_engagement (
    post_id NUMBER NOT NULL REFERENCES campaign_post,
    likes NUMBER NOT NULL,
    shares NUMBER NOT NULL,
    comments NUMBER NOT NULL,
    views NUMBER NOT NULL,
    reach NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unq_eng UNIQUE (post_id)
);

CREATE TABLE campaign_performance (
    campaign_performance_id NUMBER PRIMARY KEY,
    influencer_id NUMBER NOT NULL REFERENCES influencer,
    campaign_id NUMBER NOT NULL REFERENCES campaign,
    clicks NUMBER NOT NULL,
    impressions NUMBER NOT NULL,
    engagement NUMBER NOT NULL,
    posts_count NUMBER NOT NULL,
    reach NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE brand_id_seq
ORDER;

CREATE SEQUENCE influencer_id_seq
ORDER;

CREATE SEQUENCE skill_id_seq
ORDER;

CREATE SEQUENCE platform_id_seq
ORDER;

CREATE SEQUENCE social_media_account_id_seq
ORDER;

CREATE SEQUENCE campaign_id_seq
ORDER;

CREATE SEQUENCE post_id_seq
ORDER;

CREATE SEQUENCE campaign_performance_id_seq
ORDER;


-- Package --

CREATE OR REPLACE PACKAGE app_admin_pkg AS
    PROCEDURE insert_brand(
        p_brand_name IN brand.brand_name%TYPE,
        p_contact_person IN brand.contact_person%TYPE,
        p_brand_location IN brand.brand_location%TYPE,
        p_website IN brand.website%TYPE,
        p_email IN brand.email%TYPE
    );

     PROCEDURE insert_influencer(
        p_first_name IN influencer.first_name%TYPE,
        p_last_name IN influencer.last_name%TYPE,
        p_influencer_location IN influencer.influencer_location%TYPE,
        p_email IN influencer.email%TYPE,
        p_phone IN influencer.phone%TYPE,
        p_gender IN influencer.gender%TYPE
    );

    PROCEDURE insert_skill(
        p_skill_name IN skill.skill_name%TYPE,
        p_skill_description IN skill.skill_description%TYPE
    );

    PROCEDURE insert_influencer_skill(
        p_skill_id IN influencer_skill.skill_id%TYPE,
        p_influencer_id IN influencer_skill.influencer_id%TYPE
    );
    
    PROCEDURE insert_social_media_platform(
        p_platform_name IN social_media_platform.platform_name%TYPE,
        p_platform_website IN social_media_platform.platform_website%TYPE,
        p_platform_description IN social_media_platform.platform_description%TYPE
    );

    PROCEDURE insert_social_media_account(
        p_platform_id IN social_media_account.platform_id%TYPE,
        p_influencer_id IN social_media_account.influncer_id%TYPE,
        p_account_handle IN social_media_account.account_handle%TYPE,
        p_account_url IN social_media_account.account_url%TYPE,
        p_followers IN social_media_account.followers%TYPE,
        p_bio IN social_media_account.bio%TYPE,
        p_verified IN social_media_account.verified%TYPE
    );

    PROCEDURE insert_campaign(
        p_brand_id IN campaign.brand_id%TYPE,
        p_campaign_name IN campaign.campaign_name%TYPE,
        p_campaign_objective IN campaign.campaign_objective%TYPE,
        p_target_audience IN campaign.target_audience%TYPE,
        p_start_date IN campaign.start_date%TYPE,
        p_end_date IN campaign.end_date%TYPE,
        p_budget IN campaign.budget%TYPE,
        p_campaign_priority IN campaign.campaign_priority%TYPE
    );

    PROCEDURE insert_campaign_post(
        p_campaign_id IN campaign.campaign_id%TYPE,
        p_social_media_account_id IN social_media_account.social_media_account_id%TYPE,
        p_post_caption IN campaign_post.post_caption%TYPE,
        p_post_image IN campaign_post.post_image%TYPE
    );

    PROCEDURE insert_post_engagement(
        p_post_id IN post_engagement.post_id%TYPE,
        p_likes IN post_engagement.likes%TYPE,
        p_shares IN post_engagement.shares%TYPE,
        p_comments IN post_engagement.comments%TYPE,
        p_views IN NUMBER,
        p_reach IN post_engagement.reach%TYPE
    );


    PROCEDURE insert_campaign_performance (
        p_influencer_id IN campaign_performance.influencer_id%TYPE,
        p_campaign_id IN campaign_performance.campaign_id%TYPE,
        p_clicks IN campaign_performance.clicks%TYPE,
        p_impressions IN campaign_performance.impressions%TYPE,
        p_engagement IN campaign_performance.engagement%TYPE,
        p_posts_count IN campaign_performance.posts_count%TYPE,
        p_reach IN campaign_performance.reach%TYPE
    );

END app_admin_pkg;
/

CREATE OR REPLACE PACKAGE BODY app_admin_pkg AS
    PROCEDURE insert_brand(
        p_brand_name IN brand.brand_name%TYPE,
        p_contact_person IN brand.contact_person%TYPE,
        p_brand_location IN brand.brand_location%TYPE,
        p_website IN brand.website%TYPE,
        p_email IN brand.email%TYPE
    ) AS
    BEGIN
        INSERT INTO brand (
            brand_id,
            brand_name,
            contact_person,
            brand_location,
            website,
            email
        ) VALUES (
            brand_id_seq.NEXTVAL,
            p_brand_name,
            p_contact_person,
            p_brand_location,
            p_website,
            p_email
        );
    END insert_brand;

    PROCEDURE insert_influencer(
        p_first_name IN influencer.first_name%TYPE,
        p_last_name IN influencer.last_name%TYPE,
        p_influencer_location IN influencer.influencer_location%TYPE,
        p_email IN influencer.email%TYPE,
        p_phone IN influencer.phone%TYPE,
        p_gender IN influencer.gender%TYPE
    ) AS
    BEGIN
        INSERT INTO influencer (
            influencer_id,
            first_name,
            last_name,
            influencer_location,
            email,
            phone,
            gender
        ) VALUES (
            influencer_id_seq.NEXTVAL,
            p_first_name,
            p_last_name,
            p_influencer_location,
            p_email,
            p_phone,
            p_gender
        );
    END insert_influencer;

    PROCEDURE insert_skill(
        p_skill_name IN skill.skill_name%TYPE,
        p_skill_description IN skill.skill_description%TYPE
    ) AS
    BEGIN
        INSERT INTO skill (
            skill_id,
            skill_name,
            skill_description
        ) VALUES (
            skill_id_seq.NEXTVAL,
            p_skill_name,
            p_skill_description
        );
    END insert_skill;

    PROCEDURE insert_influencer_skill(
        p_skill_id IN influencer_skill.skill_id%TYPE,
        p_influencer_id IN influencer_skill.influencer_id%TYPE
    ) AS
    BEGIN
        INSERT INTO influencer_skill (
            skill_id,
            influencer_id
        ) VALUES (
            p_skill_id,
            p_influencer_id
        );
    END insert_influencer_skill;

    PROCEDURE insert_social_media_platform(
        p_platform_name IN social_media_platform.platform_name%TYPE,
        p_platform_website IN social_media_platform.platform_website%TYPE,
        p_platform_description IN social_media_platform.platform_description%TYPE
    ) AS
    BEGIN
        INSERT INTO social_media_platform (
            platform_id,
            platform_name,
            platform_website,
            platform_description
        ) VALUES (
            platform_id_seq.NEXTVAL,
            p_platform_name,
            p_platform_website,
            p_platform_description
        );
    END insert_social_media_platform;

    PROCEDURE insert_social_media_account(
        p_platform_id IN social_media_account.platform_id%TYPE,
        p_influencer_id IN social_media_account.influncer_id%TYPE,
        p_account_handle IN social_media_account.account_handle%TYPE,
        p_account_url IN social_media_account.account_url%TYPE,
        p_followers IN social_media_account.followers%TYPE,
        p_bio IN social_media_account.bio%TYPE,
        p_verified IN social_media_account.verified%TYPE
    ) AS
    BEGIN
        INSERT INTO social_media_account (
            social_media_account_id,
            platform_id,
            influncer_id,
            account_handle,
            account_url,
            followers,
            bio,
            verified
        ) VALUES (
            social_media_account_id_seq.NEXTVAL,
            p_platform_id,
            p_influencer_id,
            p_account_handle,
            p_account_url,
            p_followers,
            p_bio,
            p_verified
        );
    END insert_social_media_account;

    PROCEDURE insert_campaign(
        p_brand_id IN campaign.brand_id%TYPE,
        p_campaign_name IN campaign.campaign_name%TYPE,
        p_campaign_objective IN campaign.campaign_objective%TYPE,
        p_target_audience IN campaign.target_audience%TYPE,
        p_start_date IN campaign.start_date%TYPE,
        p_end_date IN campaign.end_date%TYPE,
        p_budget IN campaign.budget%TYPE,
        p_campaign_priority IN campaign.campaign_priority%TYPE
    )
    AS
    BEGIN
        INSERT INTO campaign(
        campaign_id,
        brand_id,
        campaign_name,
        campaign_objective,
        target_audience,
        start_date,
        end_date,
        budget,
        campaign_priority
        )
        VALUES (
        campaign_id_seq.NEXTVAL,
        p_brand_id,
        p_campaign_name,
        p_campaign_objective,
        p_target_audience,
        p_start_date,
        p_end_date,
        p_budget,
        p_campaign_priority
        );
    END insert_campaign;

  PROCEDURE insert_campaign_post(
        p_campaign_id IN campaign.campaign_id%TYPE,
        p_social_media_account_id IN social_media_account.social_media_account_id%TYPE,
        p_post_caption IN campaign_post.post_caption%TYPE,
        p_post_image IN campaign_post.post_image%TYPE
    )
    AS
    BEGIN
        INSERT INTO campaign_post (
            post_id,
            campaign_id,
            social_media_account_id,
            post_caption,
            post_image
        ) VALUES (
            post_id_seq.NEXTVAL,
            p_campaign_id,
            p_social_media_account_id,
            p_post_caption,
            p_post_image
        );
    END insert_campaign_post;

    PROCEDURE insert_post_engagement(
        p_post_id IN post_engagement.post_id%TYPE,
        p_likes IN post_engagement.likes%TYPE,
        p_shares IN post_engagement.shares%TYPE,
        p_comments IN post_engagement.comments%TYPE,
        p_views IN NUMBER,
        p_reach IN post_engagement.reach%TYPE
    ) IS
    BEGIN
        INSERT INTO post_engagement(post_id, likes, shares, comments, views, reach)
        VALUES (p_post_id, p_likes, p_shares, p_comments, p_views, p_reach);
    END insert_post_engagement;

    PROCEDURE insert_campaign_performance (
        p_influencer_id IN campaign_performance.influencer_id%TYPE,
        p_campaign_id IN campaign_performance.campaign_id%TYPE,
        p_clicks IN campaign_performance.clicks%TYPE,
        p_impressions IN campaign_performance.impressions%TYPE,
        p_engagement IN campaign_performance.engagement%TYPE,
        p_posts_count IN campaign_performance.posts_count%TYPE,
        p_reach IN campaign_performance.reach%TYPE
    ) AS
    BEGIN
        INSERT INTO campaign_performance (campaign_performance_id, influencer_id, campaign_id, clicks, impressions, engagement, posts_count, reach)
        VALUES (campaign_performance_id_seq.NEXTVAL, p_influencer_id, p_campaign_id, p_clicks, p_impressions, p_engagement, p_posts_count, p_reach);
    END insert_campaign_performance;

END app_admin_pkg;
/
CREATE OR REPLACE PACKAGE campaign_manager_pkg AS

    PROCEDURE insert_campaign(
        p_brand_id IN campaign.brand_id%TYPE,
        p_campaign_name IN campaign.campaign_name%TYPE,
        p_campaign_objective IN campaign.campaign_objective%TYPE,
        p_target_audience IN campaign.target_audience%TYPE,
        p_start_date IN campaign.start_date%TYPE,
        p_end_date IN campaign.end_date%TYPE,
        p_budget IN campaign.budget%TYPE,
        p_campaign_priority IN campaign.campaign_priority%TYPE
    );

    PROCEDURE insert_campaign_performance (
        p_influencer_id IN campaign_performance.influencer_id%TYPE,
        p_campaign_id IN campaign_performance.campaign_id%TYPE,
        p_clicks IN campaign_performance.clicks%TYPE,
        p_impressions IN campaign_performance.impressions%TYPE,
        p_engagement IN campaign_performance.engagement%TYPE,
        p_posts_count IN campaign_performance.posts_count%TYPE,
        p_reach IN campaign_performance.reach%TYPE
    );

    FUNCTION calculate_campaign_engagement(p_campaign_id IN campaign.campaign_id%TYPE)
    RETURN NUMBER;

    FUNCTION get_impressions(campaign_id_in IN NUMBER)
    RETURN NUMBER;
  
    FUNCTION calculate_clicks(p_campaign_id IN campaign.campaign_id%TYPE)
    RETURN NUMBER;



END campaign_manager_pkg;
/

CREATE OR REPLACE PACKAGE BODY campaign_manager_pkg AS
    

    PROCEDURE insert_campaign(
        p_brand_id IN campaign.brand_id%TYPE,
        p_campaign_name IN campaign.campaign_name%TYPE,
        p_campaign_objective IN campaign.campaign_objective%TYPE,
        p_target_audience IN campaign.target_audience%TYPE,
        p_start_date IN campaign.start_date%TYPE,
        p_end_date IN campaign.end_date%TYPE,
        p_budget IN campaign.budget%TYPE,
        p_campaign_priority IN campaign.campaign_priority%TYPE
    )
    AS
    BEGIN
        INSERT INTO campaign(
        campaign_id,
        brand_id,
        campaign_name,
        campaign_objective,
        target_audience,
        start_date,
        end_date,
        budget,
        campaign_priority
        )
        VALUES (
        campaign_id_seq.NEXTVAL,
        p_brand_id,
        p_campaign_name,
        p_campaign_objective,
        p_target_audience,
        p_start_date,
        p_end_date,
        p_budget,
        p_campaign_priority
        );
    END insert_campaign;

    PROCEDURE insert_campaign_performance (
        p_influencer_id IN campaign_performance.influencer_id%TYPE,
        p_campaign_id IN campaign_performance.campaign_id%TYPE,
        p_clicks IN campaign_performance.clicks%TYPE,
        p_impressions IN campaign_performance.impressions%TYPE,
        p_engagement IN campaign_performance.engagement%TYPE,
        p_posts_count IN campaign_performance.posts_count%TYPE,
        p_reach IN campaign_performance.reach%TYPE
    ) AS
    BEGIN
        INSERT INTO campaign_performance (campaign_performance_id, influencer_id, campaign_id, clicks, impressions, engagement, posts_count, reach)
        VALUES (campaign_performance_id_seq.NEXTVAL, p_influencer_id, p_campaign_id, p_clicks, p_impressions, p_engagement, p_posts_count, p_reach);
    END insert_campaign_performance;

    FUNCTION calculate_campaign_engagement(p_campaign_id IN campaign.campaign_id%TYPE)
        RETURN NUMBER
    IS
        v_total_engagement NUMBER := 0;
    BEGIN
        SELECT SUM(pe.likes + pe.shares + pe.comments)
        INTO v_total_engagement
        FROM campaign_post cp
        JOIN post_engagement pe ON cp.post_id = pe.post_id
        WHERE cp.campaign_id = p_campaign_id;

        RETURN v_total_engagement;
    END calculate_campaign_engagement;

    FUNCTION get_impressions(campaign_id_in IN NUMBER)
        RETURN NUMBER
    AS
        impressions_out NUMBER;
    BEGIN
        SELECT SUM(reach)
        INTO impressions_out
        FROM campaign_post cp
        JOIN post_engagement pe ON cp.post_id = pe.post_id
        WHERE cp.campaign_id = campaign_id_in;
        
        RETURN impressions_out;
    END;

    FUNCTION calculate_clicks(
        p_campaign_id IN campaign.campaign_id%TYPE
    )
    RETURN NUMBER
    IS
        v_impressions NUMBER;
        v_engagement NUMBER;
        v_clicks NUMBER;
    BEGIN
        SELECT SUM(reach)
        INTO v_impressions
        FROM campaign_post cp
        JOIN post_engagement pe ON cp.post_id = pe.post_id
        WHERE cp.campaign_id = p_campaign_id;


        v_engagement := campaign_manager_pkg.calculate_campaign_engagement(p_campaign_id);

        v_clicks := v_impressions * v_engagement / 100;
        RETURN v_clicks;
    END;


END campaign_manager_pkg;
/

CREATE OR REPLACE PACKAGE social_media_influencer_pkg AS


     PROCEDURE insert_influencer(
        p_first_name IN influencer.first_name%TYPE,
        p_last_name IN influencer.last_name%TYPE,
        p_influencer_location IN influencer.influencer_location%TYPE,
        p_email IN influencer.email%TYPE,
        p_phone IN influencer.phone%TYPE,
        p_gender IN influencer.gender%TYPE
    );

    PROCEDURE insert_influencer_skill(
        p_skill_id IN influencer_skill.skill_id%TYPE,
        p_influencer_id IN influencer_skill.influencer_id%TYPE
    );
    

    PROCEDURE insert_social_media_account(
        p_platform_id IN social_media_account.platform_id%TYPE,
        p_influencer_id IN social_media_account.influncer_id%TYPE,
        p_account_handle IN social_media_account.account_handle%TYPE,
        p_account_url IN social_media_account.account_url%TYPE,
        p_followers IN social_media_account.followers%TYPE,
        p_bio IN social_media_account.bio%TYPE,
        p_verified IN social_media_account.verified%TYPE
    );



    PROCEDURE insert_campaign_post(
        p_campaign_id IN campaign.campaign_id%TYPE,
        p_social_media_account_id IN social_media_account.social_media_account_id%TYPE,
        p_post_caption IN campaign_post.post_caption%TYPE,
        p_post_image IN campaign_post.post_image%TYPE
    );
        PROCEDURE insert_post_engagement(
        p_post_id IN post_engagement.post_id%TYPE,
        p_likes IN post_engagement.likes%TYPE,
        p_shares IN post_engagement.shares%TYPE,
        p_comments IN post_engagement.comments%TYPE,
        p_views IN NUMBER,
        p_reach IN post_engagement.reach%TYPE
    );


END social_media_influencer_pkg;
/

CREATE OR REPLACE PACKAGE BODY social_media_influencer_pkg AS

    PROCEDURE insert_influencer(
        p_first_name IN influencer.first_name%TYPE,
        p_last_name IN influencer.last_name%TYPE,
        p_influencer_location IN influencer.influencer_location%TYPE,
        p_email IN influencer.email%TYPE,
        p_phone IN influencer.phone%TYPE,
        p_gender IN influencer.gender%TYPE
    ) AS
    BEGIN
        INSERT INTO influencer (
            influencer_id,
            first_name,
            last_name,
            influencer_location,
            email,
            phone,
            gender
        ) VALUES (
            influencer_id_seq.NEXTVAL,
            p_first_name,
            p_last_name,
            p_influencer_location,
            p_email,
            p_phone,
            p_gender
        );
    END insert_influencer;

    PROCEDURE insert_influencer_skill(
        p_skill_id IN influencer_skill.skill_id%TYPE,
        p_influencer_id IN influencer_skill.influencer_id%TYPE
    ) AS
    BEGIN
        INSERT INTO influencer_skill (
            skill_id,
            influencer_id
        ) VALUES (
            p_skill_id,
            p_influencer_id
        );
    END insert_influencer_skill;

    PROCEDURE insert_social_media_account(
        p_platform_id IN social_media_account.platform_id%TYPE,
        p_influencer_id IN social_media_account.influncer_id%TYPE,
        p_account_handle IN social_media_account.account_handle%TYPE,
        p_account_url IN social_media_account.account_url%TYPE,
        p_followers IN social_media_account.followers%TYPE,
        p_bio IN social_media_account.bio%TYPE,
        p_verified IN social_media_account.verified%TYPE
    ) AS
    BEGIN
        INSERT INTO social_media_account (
            social_media_account_id,
            platform_id,
            influncer_id,
            account_handle,
            account_url,
            followers,
            bio,
            verified
        ) VALUES (
            social_media_account_id_seq.NEXTVAL,
            p_platform_id,
            p_influencer_id,
            p_account_handle,
            p_account_url,
            p_followers,
            p_bio,
            p_verified
        );
    END insert_social_media_account;

  PROCEDURE insert_campaign_post(
        p_campaign_id IN campaign.campaign_id%TYPE,
        p_social_media_account_id IN social_media_account.social_media_account_id%TYPE,
        p_post_caption IN campaign_post.post_caption%TYPE,
        p_post_image IN campaign_post.post_image%TYPE
    )
    AS
    BEGIN
        INSERT INTO campaign_post (
            post_id,
            campaign_id,
            social_media_account_id,
            post_caption,
            post_image
        ) VALUES (
            post_id_seq.NEXTVAL,
            p_campaign_id,
            p_social_media_account_id,
            p_post_caption,
            p_post_image
        );
    END insert_campaign_post;

    PROCEDURE insert_post_engagement(
        p_post_id IN post_engagement.post_id%TYPE,
        p_likes IN post_engagement.likes%TYPE,
        p_shares IN post_engagement.shares%TYPE,
        p_comments IN post_engagement.comments%TYPE,
        p_views IN NUMBER,
        p_reach IN post_engagement.reach%TYPE
    ) IS
    BEGIN
        INSERT INTO post_engagement(post_id, likes, shares, comments, views, reach)
        VALUES (p_post_id, p_likes, p_shares, p_comments, p_views, p_reach);
    END insert_post_engagement;


END social_media_influencer_pkg;
/



CREATE OR REPLACE PROCEDURE reset_data(table_name varchar)
AS
BEGIN
  EXECUTE IMMEDIATE 'TRUNCATE TABLE ' || table_name;
END;
/

CREATE OR REPLACE PROCEDURE reset_seq(seq_name varchar)
AS
BEGIN
  EXECUTE IMMEDIATE 'alter sequence ' || seq_name || ' restart start with 1';
END;
/

--Triggers--

CREATE OR REPLACE TRIGGER create_post_engagement_trigger
AFTER INSERT ON campaign_post
FOR EACH ROW
BEGIN
  INSERT INTO post_engagement(post_id, likes, shares, comments, views, reach)
    VALUES(:new.post_id,
        ROUND(DBMS_RANDOM.VALUE(1, 100)), 
       ROUND(DBMS_RANDOM.VALUE(1, 50)), 
       ROUND(DBMS_RANDOM.VALUE(1, 20)), 
       ROUND(DBMS_RANDOM.VALUE(100, 1000)), 
       ROUND(DBMS_RANDOM.VALUE(100, 500)));
END;
/

CREATE OR REPLACE TRIGGER TRG_CREATE_CAMPAIGN_PERFORMANCE
FOR INSERT ON campaign_post
COMPOUND TRIGGER

    -- Define package-level variables to store campaign_id and social_media_account_id
    g_campaign_id campaign_post.campaign_id%TYPE;
    g_social_media_account_id campaign_post.social_media_account_id%TYPE;

    -- BEFORE EACH ROW section to store campaign_id and social_media_account_id
    BEFORE EACH ROW IS
    BEGIN
        g_campaign_id := :NEW.campaign_id;
        g_social_media_account_id := :NEW.social_media_account_id;
    END BEFORE EACH ROW;

    -- AFTER STATEMENT section to perform calculations and updates on campaign_performance table
    AFTER STATEMENT IS
        inf_id NUMBER;
        v_impressions NUMBER;
        v_engagement NUMBER;
        v_clicks NUMBER;
    BEGIN
        SELECT influncer_id INTO inf_id FROM social_media_account WHERE social_media_account_id = g_social_media_account_id;

        -- Get impressions for this campaign
        v_impressions := campaign_manager_pkg.get_impressions(g_campaign_id);

        -- Get engagement for this campaign
        v_engagement := campaign_manager_pkg.calculate_campaign_engagement(g_campaign_id);

        -- Get clicks for this campaign
        v_clicks := ROUND(campaign_manager_pkg.calculate_clicks(g_campaign_id));

        -- Update existing campaign_performance row if it exists
        UPDATE campaign_performance SET
            posts_count = posts_count + 1,
            clicks = v_clicks,
            impressions = v_impressions,
            engagement = v_engagement
        WHERE influencer_id = inf_id AND campaign_id = g_campaign_id;

        -- Insert new campaign_performance row if it doesn't exist
        INSERT INTO campaign_performance (
            campaign_performance_id,
            influencer_id,
            campaign_id,
            clicks,
            impressions,
            engagement,
            posts_count,
            reach
        )
        SELECT
            campaign_performance_id_seq.nextval,
            inf_id,
            g_campaign_id,
            v_clicks,
            v_impressions,
            v_engagement,
            1,
            ROUND(DBMS_RANDOM.VALUE(100, 10000))
        FROM dual
        WHERE NOT EXISTS (
            SELECT 1
            FROM campaign_performance
            WHERE influencer_id = inf_id AND campaign_id = g_campaign_id
        );
    END AFTER STATEMENT;

END TRG_CREATE_CAMPAIGN_PERFORMANCE;
/

--SELECT campaign_performance_id_seq.nextval,inf_id, :NEW.campaign_id, campaign_manager_pkg.calculate_clicks(inf_id), campaign_manager_pkg.get_impressions(inf_id), campaign_manager_pkg.calculate_campaign_engagement(inf_id), 1, 0 FROM dual
--Triggers--

-- Package --



--Post Engagement:
-- BEGIN
-- -- Post engagement for Apple iPhone 13 Launch campaign, post 1
-- social_media_influencer_pkg.insert_post_engagement (1, 10000, 5000, 2000, 50000, 100000);

-- -- Post engagement for Apple iPhone 13 Launch campaign, post 2
-- social_media_influencer_pkg.insert_post_engagement (2, 5000, 2500, 1000, 25000, 50000);

-- -- Post engagement for Apple iPhone 13 Launch campaign, post 1
-- social_media_influencer_pkg.insert_post_engagement(3, 5000, 2000, 1000, 10000, 15000);

-- -- Post engagement for Apple iPhone 13 Launch campaign, post 2
-- social_media_influencer_pkg.insert_post_engagement(4, 10000, 5000, 2500, 20000, 30000);

-- -- Post engagement for Apple Holiday Gift Guide campaign, post 1
-- social_media_influencer_pkg.insert_post_engagement(5, 2000, 500, 100, 5000, 7500);

-- -- Post engagement for Apple Holiday Gift Guide campaign, post 2
-- social_media_influencer_pkg.insert_post_engagement(6, 5000, 1500, 500, 10000, 15000);
-- END;
-- /

-- Campaign Performance:
-- BEGIN
-- -- iPhone 13 Launch campaign, Influencer 1
-- campaign_manager_pkg.insert_campaign_performance( 1, 1, campaign_manager_pkg.calculate_clicks(1), campaign_manager_pkg.get_impressions(1), campaign_manager_pkg.calculate_campaign_engagement(1), 2, 150000);

-- -- iPhone 13 Launch campaign, Influencer 2
-- campaign_manager_pkg.insert_campaign_performance( 2, 1, campaign_manager_pkg.calculate_clicks(1), campaign_manager_pkg.get_impressions(1), campaign_manager_pkg.calculate_campaign_engagement(1), 1, 50000);

-- -- Holiday Gift Guide campaign, Influencer 1
-- campaign_manager_pkg.insert_campaign_performance( 1, 2, campaign_manager_pkg.calculate_clicks(2), campaign_manager_pkg.get_impressions(2), campaign_manager_pkg.calculate_campaign_engagement(2), 1, 15000);

-- -- Holiday Gift Guide campaign, Influencer 3
-- campaign_manager_pkg.insert_campaign_performance( 3, 2, campaign_manager_pkg.calculate_clicks(2), campaign_manager_pkg.get_impressions(2), campaign_manager_pkg.calculate_campaign_engagement(2), 1, 25000);

-- END;
-- /


-- Views --

CREATE OR REPLACE VIEW INFLUENCER_PROFILES AS
select * from INFLUENCER ;

CREATE OR REPLACE VIEW BRANDS AS
select * from BRAND ;

CREATE OR REPLACE VIEW influencer_skill_view AS
SELECT i.influencer_id, i.first_name, i.last_name, i.influencer_location, s.skill_name, s.skill_description
FROM influencer i
INNER JOIN influencer_skill isk ON i.influencer_id = isk.influencer_id
INNER JOIN skill s ON isk.skill_id = s.skill_id;



CREATE OR REPLACE VIEW campaign_post_view AS
SELECT 
    cp.post_id,
    cp.campaign_id,
    cp.post_caption,
    cp.post_image,
    cp.created_at AS post_date,
    inf.first_name || ' ' || inf.last_name AS influencer_name,
    b.brand_name
FROM 
    campaign_post cp
    JOIN social_media_account sma ON sma.social_media_account_id = cp.social_media_account_id
    JOIN influencer inf ON inf.influencer_id = sma.influncer_id
    JOIN campaign c ON c.campaign_id = cp.campaign_id
    JOIN brand b ON b.brand_id = c.brand_id;



CREATE OR REPLACE VIEW campaign_objective_view AS
SELECT 
    c.campaign_id,
    c.campaign_name,
    c.campaign_objective,
    c.target_audience,
    c.campaign_priority
FROM 
    campaign c;



CREATE OR REPLACE VIEW social_media_account_view AS
SELECT 
    sma.social_media_account_id,
    smp.platform_name,
    sma.account_handle,
    sma.followers,
    sma.bio,
    sma.account_url
FROM 
    social_media_account sma
    JOIN social_media_platform smp ON sma.platform_id = smp.platform_id;



CREATE OR REPLACE VIEW influencer_engagement_analysis_view AS
SELECT 
    i.influencer_id,
    i.first_name || ' ' || i.last_name AS influencer_name,
    smp.platform_name,
    c.campaign_name,
    ROUND((pe.likes + pe.shares + pe.comments) / pe.views * 100, 2) AS engagement_rate
FROM 
    influencer i
    JOIN social_media_account sma ON i.influencer_id = sma.influncer_id
    JOIN social_media_platform smp ON sma.platform_id = smp.platform_id
    JOIN campaign_post cp ON sma.social_media_account_id = cp.social_media_account_id
    JOIN post_engagement pe ON cp.post_id = pe.post_id
    JOIN campaign c ON cp.campaign_id = c.campaign_id;
    


CREATE OR REPLACE VIEW campaign_timeline_view AS
SELECT c.campaign_id, c.campaign_name, c.campaign_objective, c.target_audience, 
    c.start_date, c.end_date, c.budget, c.campaign_priority, 
    COUNT(cp.post_id) AS total_posts 
FROM campaign c 
LEFT JOIN campaign_post cp ON c.campaign_id = cp.campaign_id 
GROUP BY c.campaign_id, c.campaign_name, c.campaign_objective, c.target_audience, 
    c.start_date, c.end_date, c.budget, c.campaign_priority 
ORDER BY c.start_date;


CREATE OR REPLACE VIEW influencer_post_engagement_rate AS
SELECT cp.post_id, cp.post_caption, cp.post_image, c.campaign_name, i.first_name, i.last_name,
    se.likes, se.shares, se.comments, se.views, se.reach,
    ((se.likes + se.shares + se.comments) / se.reach) * 100 as engagement_rate
FROM campaign_post cp
INNER JOIN campaign c ON c.campaign_id = cp.campaign_id
INNER JOIN social_media_account sma ON sma.social_media_account_id = cp.social_media_account_id
INNER JOIN influencer i ON i.influencer_id = sma.influncer_id
INNER JOIN post_engagement se ON se.post_id = cp.post_id;





