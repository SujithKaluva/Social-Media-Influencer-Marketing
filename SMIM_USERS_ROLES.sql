purge recyclebin;
SET SERVEROUTPUT on;

DECLARE
   APP_ADMINUSER NUMBER;
   CAMPAIGNMANAGERUSER NUMBER;
   INFLUENCERONE NUMBER;
   APP_ADMIN_ROLE_COUNT NUMBER;
   CAMPAIGN_MANAGER_ROLE_COUNT NUMBER;
   INFLUENCER_ROLE_COUNT NUMBER;

BEGIN
   select count(*) into APP_ADMINUSER from all_users where USERNAME = 'APP_ADMINUSER';
   select count(*) into CAMPAIGNMANAGERUSER from all_users where USERNAME = 'CAMPAIGNMANAGERUSER';
   select count(*) into INFLUENCERONE from all_users where USERNAME = 'INFLUENCERONE';

   SELECT COUNT(*) INTO INFLUENCER_ROLE_COUNT FROM DBA_ROLES WHERE ROLE = 'INFLUENCER';
   SELECT COUNT(*) INTO CAMPAIGN_MANAGER_ROLE_COUNT FROM DBA_ROLES WHERE ROLE = 'CAMPAIGN_MANAGER';
   SELECT COUNT(*) INTO APP_ADMIN_ROLE_COUNT FROM DBA_ROLES WHERE ROLE = 'APP_ADMIN';
   
  IF(APP_ADMINUSER > 0) THEN EXECUTE IMMEDIATE 'DROP USER APP_ADMINUSER CASCADE'; END IF;
  IF(CAMPAIGNMANAGERUSER > 0) THEN EXECUTE IMMEDIATE 'DROP USER CAMPAIGNMANAGERUSER CASCADE'; END IF;
  IF(INFLUENCERONE > 0) THEN EXECUTE IMMEDIATE 'DROP USER INFLUENCERONE CASCADE'; END IF;

  IF(APP_ADMIN_ROLE_COUNT > 0) THEN EXECUTE IMMEDIATE 'DROP ROLE APP_ADMIN'; END IF;
  IF(CAMPAIGN_MANAGER_ROLE_COUNT > 0) THEN EXECUTE IMMEDIATE 'DROP ROLE CAMPAIGN_MANAGER'; END IF;
  IF(INFLUENCER_ROLE_COUNT > 0) THEN EXECUTE IMMEDIATE 'DROP ROLE INFLUENCER'; END IF;
  
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


CREATE USER APP_ADMINUSER IDENTIFIED BY "Neudmdd12345";
GRANT APP_ADMIN TO APP_ADMINUSER;

CREATE USER CAMPAIGNMANAGERUSER IDENTIFIED BY "Neudmdd12345";
GRANT CAMPAIGN_MANAGER TO CAMPAIGNMANAGERUSER;

CREATE USER INFLUENCERONE IDENTIFIED BY "Neudmdd12345";
GRANT INFLUENCER TO INFLUENCERONE;

GRANT CONNECT TO APP_ADMIN;
GRANT CONNECT TO CAMPAIGN_MANAGER;
GRANT CONNECT TO INFLUENCER;

--Granting Sequence Permssions--

-- APP_ADMIN --

GRANT SELECT ON brand_id_seq to APP_ADMIN;
GRANT SELECT ON skill_id_seq to APP_ADMIN;
GRANT SELECT ON platform_id_seq to APP_ADMIN;
GRANT SELECT ON campaign_id_seq to APP_ADMIN;
GRANT SELECT ON campaign_performance_id_seq to APP_ADMIN;
GRANT SELECT ON influencer_id_seq to APP_ADMIN;
GRANT SELECT ON social_media_account_id_seq to APP_ADMIN;
GRANT SELECT ON post_id_seq to APP_ADMIN;

-- CAMPAIGN_MANAGER --

GRANT SELECT ON campaign_id_seq to CAMPAIGN_MANAGER;
GRANT SELECT ON campaign_performance_id_seq to CAMPAIGN_MANAGER;

-- INFLUENCER --

GRANT SELECT ON influencer_id_seq to INFLUENCER;
GRANT SELECT ON social_media_account_id_seq to INFLUENCER;
GRANT SELECT ON post_id_seq to INFLUENCER;

--Granting Table Permssions--

-- APP_ADMIN --

GRANT ALL ON BRAND TO APP_ADMIN;
GRANT ALL ON SKILL to APP_ADMIN;
GRANT ALL ON SOCIAL_MEDIA_PLATFORM to APP_ADMIN;
GRANT ALL ON CAMPAIGN to APP_ADMIN;
GRANT ALL ON CAMPAIGN_PERFORMANCE to APP_ADMIN;
GRANT ALL ON POST_ENGAGEMENT to APP_ADMIN;
GRANT ALL ON SOCIAL_MEDIA_ACCOUNT to APP_ADMIN;
GRANT ALL ON INFLUENCER to APP_ADMIN;
GRANT ALL ON CAMPAIGN_POST to APP_ADMIN;
GRANT ALL ON INFLUENCER_SKILL to APP_ADMIN;

-- CAMPAIGN_MANAGER --

GRANT READ ON BRAND TO CAMPAIGN_MANAGER;
GRANT READ ON SKILL to CAMPAIGN_MANAGER;
GRANT READ ON SOCIAL_MEDIA_PLATFORM to CAMPAIGN_MANAGER;
GRANT READ ON INFLUENCER_SKILL to CAMPAIGN_MANAGER;
GRANT READ ON INFLUENCER to CAMPAIGN_MANAGER;
GRANT READ ON SOCIAL_MEDIA_ACCOUNT to CAMPAIGN_MANAGER;
GRANT ALL ON CAMPAIGN to CAMPAIGN_MANAGER;
GRANT ALL ON CAMPAIGN_PERFORMANCE to CAMPAIGN_MANAGER;
GRANT READ ON CAMPAIGN_POST to CAMPAIGN_MANAGER;
GRANT READ ON POST_ENGAGEMENT to CAMPAIGN_MANAGER;

-- INFLUENCER --
-- GRANT ALL ON INFLUENCER_SKILL to INFLUENCER;
-- GRANT ALL ON INFLUENCER to INFLUENCER;
-- GRANT ALL ON SOCIAL_MEDIA_ACCOUNT to INFLUENCER;
-- GRANT ALL ON CAMPAIGN_POST to INFLUENCER;

GRANT READ ON BRAND TO INFLUENCER;
GRANT READ ON SKILL to INFLUENCER;
GRANT READ ON SOCIAL_MEDIA_PLATFORM to INFLUENCER;
GRANT READ ON POST_ENGAGEMENT to INFLUENCER;
GRANT READ ON CAMPAIGN to INFLUENCER;
GRANT INSERT ON INFLUENCER_SKILL to INFLUENCER;
GRANT DELETE ON INFLUENCER_SKILL to INFLUENCER;
GRANT INSERT ON INFLUENCER to INFLUENCER;
GRANT UPDATE ON INFLUENCER to INFLUENCER;
GRANT DELETE ON INFLUENCER to INFLUENCER;
GRANT INSERT ON SOCIAL_MEDIA_ACCOUNT to INFLUENCER;
GRANT UPDATE ON SOCIAL_MEDIA_ACCOUNT to INFLUENCER;
GRANT DELETE ON SOCIAL_MEDIA_ACCOUNT to INFLUENCER;
GRANT INSERT ON CAMPAIGN_POST to INFLUENCER;
GRANT UPDATE ON CAMPAIGN_POST to INFLUENCER;
GRANT DELETE ON CAMPAIGN_POST to INFLUENCER;
GRANT INSERT ON POST_ENGAGEMENT to INFLUENCER;
GRANT UPDATE ON POST_ENGAGEMENT to INFLUENCER;
GRANT DELETE ON POST_ENGAGEMENT to INFLUENCER;
-- Permissions for Views --

GRANT select on INFLUENCER_PROFILES TO CAMPAIGN_MANAGER;
GRANT select on BRANDS TO CAMPAIGN_MANAGER;
GRANT select on influencer_skill_view TO CAMPAIGN_MANAGER;
GRANT select on campaign_post_view TO CAMPAIGN_MANAGER;
GRANT select on campaign_objective_view TO CAMPAIGN_MANAGER;
GRANT select on social_media_account_view TO CAMPAIGN_MANAGER;
GRANT select on influencer_engagement_analysis_view TO CAMPAIGN_MANAGER;
GRANT select on campaign_timeline_view TO CAMPAIGN_MANAGER;
GRANT select on influencer_post_engagement_rate TO CAMPAIGN_MANAGER;
