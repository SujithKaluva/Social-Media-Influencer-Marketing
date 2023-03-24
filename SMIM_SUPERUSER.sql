purge recyclebin;
SET SERVEROUTPUT on;

DECLARE

BEGIN
  EXECUTE IMMEDIATE 'DROP USER APP_ADMINUSER CASCADE';
  EXECUTE IMMEDIATE 'DROP USER CAMPAIGNMANAGERUSER CASCADE';
  EXECUTE IMMEDIATE 'DROP USER INFLUENCERONE CASCADE';
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
   APP_ADMINUSER number;
   CAMPAIGNMANAGERUSER number;
   INFLUENCERONE number;
BEGIN
   select count(*)
   into APP_ADMINUSER from all_users
   where USERNAME = 'APP_ADMINUSER';
   
   IF(APP_ADMINUSER > 0) THEN EXECUTE IMMEDIATE 'DROP USER APP_ADMINUSER CASCADE'; END IF;


   select count(*)
   into CAMPAIGNMANAGERUSER from all_users
   where USERNAME = 'CAMPAIGNMANAGERUSER';
   
   IF(CAMPAIGNMANAGERUSER > 0) THEN EXECUTE IMMEDIATE 'DROP USER CAMPAIGNMANAGERUSER CASCADE'; END IF;

   select count(*)
   into INFLUENCERONE from all_users
   where USERNAME = 'INFLUENCERONE';
   
   IF(INFLUENCERONE > 0) THEN EXECUTE IMMEDIATE 'DROP USER INFLUENCERONE CASCADE'; END IF;
END;
/


CREATE USER APP_ADMINUSER IDENTIFIED BY "Neudmdd12345";
GRANT APP_ADMIN TO APP_ADMINUSER;

CREATE USER CAMPAIGNMANAGERUSER IDENTIFIED BY "Neudmdd12345";
GRANT CAMPAIGN_MANAGER TO CAMPAIGNMANAGERUSER;

CREATE USER INFLUENCERONE IDENTIFIED BY "Neudmdd12345";
GRANT INFLUENCER TO INFLUENCERONE;

GRANT CONNECT TO APP_ADMIN;
GRANT CONNECT TO CAMPAIGN_MANAGER;
GRANT CONNECT TO INFLUENCER;

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
    influencer_id INT NOT NULL REFERENCES influencer,
    constraint infsk_pk PRIMARY KEY(skill_id, influencer_id),
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
    account_handle VARCHAR(30) NOT NULL,
    account_url VARCHAR(100) NOT NULL UNIQUE,
    followers INT NOT NULL,
    bio varchar(255),
    verified VARCHAR(30) NOT NULL,
    CONSTRAINT unique_account_handle_per_platform UNIQUE (platform_id, account_handle),
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

grant SELECT ON brand_id_seq to APP_ADMIN;
grant SELECT ON skill_id_seq to APP_ADMIN;
grant SELECT ON platform_id_seq to APP_ADMIN;

GRANT ALL ON BRAND TO APP_ADMIN;
GRANT ALL ON SKILL to APP_ADMIN;
GRANT ALL ON SOCIAL_MEDIA_PLATFORM to APP_ADMIN;

--Inserting Brands

-- Brand 1
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Apple','Tim Cook','Cupertino, California','apple.com','tim@apple.com');

-- Brand 2
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Amazon','Andy Jassy','Seattle, Washington','amazon.com','ajassy@amazon.com');

-- Brand 3
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Microsoft','Satya Nadella','Redmond, Washington','microsoft.com','satyan@microsoft.com');

-- Brand 4
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Facebook','Mark Zuckerberg','Menlo Park, California','facebook.com','zuck@fb.com');

-- Brand 5
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Alphabet','Sundar Pichai','Mountain View, California','abc.xyz','sundar@google.com');

-- Brand 6
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Tesla','Elon Musk','Palo Alto, California','tesla.com','elon@tesla.com');

-- Brand 7
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Netflix','Reed Hastings','Los Gatos, California','netflix.com','reed@netflix.com');

-- Brand 8
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Walmart','Doug McMillon','Bentonville, Arkansas','walmart.com','doug.mcmillon@walmart.com');

-- Brand 9
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Procter and Gamble','David Taylor','Cincinnati, Ohio','pg.com','david.taylor@pg.com');

-- Brand 10
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Johnson and Johnson','Alex Gorsky','New Brunswick, New Jersey','jnj.com','agorsky@jnj.com');

-- Brand 11
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Nike','John Donahoe','Beaverton, Oregon','nike.com','john.donahoe@nike.com');

-- Brand 12
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'PepsiCo','Ramon Laguarta','Purchase, New York','pepsico.com','ramon.laguarta@pepsico.com');

-- Brand 13
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Unilever','Alan Jope','London, United Kingdom','unilever.com','alan.jope@unilever.com');

-- Brand 14
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Coca-Cola','James Quincey','Atlanta, Georgia','coca-cola.com','jquincey@coca-cola.com');

-- Brand 15
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'BMW','Oliver Zipse','Munich, Germany','bmw.com','oliver.zipse@bmw.com');

-- Brand 16
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Mercedes-Benz','Ola Källenius','Stuttgart, Germany','mercedes-benz.com','ola.kallenius@daimler.com');

-- Brand 17
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Samsung','Kim Ki-nam','Seoul, South Korea','samsung.com','kkn@samsung.com');

-- Brand 18
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Toyota','Akio Toyoda','Toyota City, Japan','toyota.com','akio.toyoda@toyota.com');

-- Brand 19
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Ford','Jim Farley','Dearborn, Michigan','ford.com','jfarley@ford.com');

-- Brand 20
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'McDonalds','Chris Kempczinski','Chicago, Illinois','mcdonalds.com','chris.kempczinski@mcd.com');

-- Brand 21
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'General Electric','H. Lawrence Culp Jr.','Boston, Massachusetts','ge.com','larry.culp@ge.com');

-- Brand 22
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'IBM','Arvind Krishna','Armonk, New York','ibm.com','arvind.krishna@ibm.com');

-- Brand 23
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Bayer','Werner Baumann','Leverkusen, Germany','bayer.com','werner.baumann@bayer.com');

-- Brand 24
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Nissan','Makoto Uchida','Yokohama, Japan','nissan-global.com','makoto.uchida@nissan.co.jp');

-- Brand 25
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'DHL','John Pearson','Bonn, Germany','dhl.com','john.pearson@dhl.com');

-- Brand 26
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'LOréal','Nicolas Hieronimus','Clichy, France','loreal.com','nicolas.hieronimus@loreal.com');

-- Brand 27
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Chevron Corporation','Michael Wirth','San Ramon, California','chevron.com','michael.k.wirth@chevron.com');

-- Brand 28
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Nestlé','Mark Schneider','Vevey, Switzerland','nestle.com','mark.schneider@nestle.com');

-- Brand 29
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Sony','Kenichiro Yoshida','Tokyo, Japan','sony.com','kenichiro.yoshida@sony.com');

-- Brand 30
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Intel Corporation','Patrick Gelsinger','Santa Clara, California','intel.com','patrick.gelsinger@intel.com');

-- Brand 31
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'LOccitane en Provence','Reinold Geiger','Manosque, France','loccitane.com','reinold.geiger@loccitane.com');

-- Brand 32
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Delta Air Lines','Ed Bastian','Atlanta, Georgia','delta.com','ed.bastian@delta.com');

-- Brand 33
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Novartis','Vas Narasimhan','Basel, Switzerland','novartis.com','vas.narasimhan@novartis.com');

-- Brand 34
INSERT INTO BRAND(brand_id,brand_name,contact_person,brand_location,website,email) 
VALUES(brand_id_seq.nextval,'Marriott International','Anthony Capuano','Bethesda, Maryland','marriott.com','anthony.capuano@marriott.com');


-- Inserting Influencers

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'John', 'Doe', 'New York', 'john.doe1@gmail.com', '123-456-7890', 'Male');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'Jane', 'Doe', 'Los Angeles', 'jane.doe2@gmail.com', '234-567-8901', 'Female');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'Adam', 'Smith', 'London', 'adam.smith3@gmail.com', '345-678-9012', 'Male');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'Eve', 'Smith', 'Paris', 'eve.smith4@gmail.com', '456-789-0123', 'Female');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'Jack', 'Jones', 'Toronto', 'jack.jones5@gmail.com', '567-890-1234', 'Male');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'Jill', 'Jones', 'Sydney', 'jill.jones6@gmail.com', '678-901-2345', 'Female');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'Peter', 'Park', 'Seoul', 'peter.park7@gmail.com', '789-012-3456', 'Male');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'Mary', 'Park', 'Tokyo', 'mary.park8@gmail.com', '890-123-4567', 'Female');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'David', 'Lee', 'Hong Kong', 'david.lee9@gmail.com', '901-234-5678', 'Male');

INSERT INTO influencer(influencer_id, first_name, last_name, influencer_location, email, phone, gender) 
VALUES(influencer_id_seq.nextval, 'Anna', 'Lee', 'Singapore', 'anna.lee10@gmail.com', '012-345-6789', 'Female');

-- Inserting Skills

-- skills for Apple influencers
INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Tech Reviews', 'Providing reviews of Apple products or discussing tech news');

INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'App Development', 'Developing apps for iOS or discussing app development tips and trends');

INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Apple Accessories', 'Promoting Apple accessories or providing content about Apple accessories');

INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Apple Music', 'Promoting Apple Music or providing content related to music and the music industry');

INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Apple Events', 'Providing live coverage or highlights of Apple events or discussing Apple event predictions');

-- skills for Nike influencers
INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Athletic Training', 'Providing athletic training tips or promoting athletic training products');

INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Sports Nutrition', 'Providing nutrition tips or promoting nutrition products for athletes');

-- skills for Adidas influencers
INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Sportswear Design', 'Designing sportswear or promoting sportswear products');

INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Sneaker Culture', 'Promoting sneaker culture or providing content related to sneakers');

-- skills for Coca-Cola influencers
INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Beverage Promotion', 'Promoting Coca-Cola beverages or providing beverage-related content');

INSERT INTO skill (skill_id, skill_name, skill_description)
VALUES (skill_id_seq.nextval, 'Video Production', 'Creating video content for social media platforms');

--Influencer Skills Mapping
-- Influencer 1
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (1, 1); -- Tech Reviews
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (2, 1); -- App Development

-- Influencer 2
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (3, 2); -- Apple Accessories
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (4, 2); -- Apple Music

-- Influencer 3
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (1, 3); -- Tech Reviews
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (5, 3); -- Apple Events

-- Influencer 4
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (2, 4); -- App Development
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (3, 4); -- Apple Accessories

-- Influencer 5
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (1, 5); -- Tech Reviews
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (4, 5); -- Apple Music

-- Influencer 6
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (2, 6); -- App Development
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (5, 6); -- Apple Events

-- Influencer 7
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (1, 7); -- Tech Reviews
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (3, 7); -- Apple Accessories

-- Influencer 8
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (4, 8); -- Apple Music
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (5, 8); -- Apple Events

-- Influencer 9
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (1, 9); -- Tech Reviews
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (2, 9); -- App Development

-- Influencer 10
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (3, 10); -- Apple Accessories
INSERT INTO influencer_skill (skill_id, influencer_id)
VALUES (4, 10); -- Apple Music

--Social Media Platforms -- Insert

INSERT INTO social_media_platform (platform_id, platform_name, platform_website, platform_description)
VALUES (platform_id_seq.nextval, 'Facebook', 'www.facebook.com', 'A social networking website where users can connect with friends and family, and join groups to share common interests.');

INSERT INTO social_media_platform (platform_id, platform_name, platform_website, platform_description)
VALUES (platform_id_seq.nextval, 'Twitter', 'www.twitter.com', 'A microblogging and social networking platform where users can share short messages and follow other users.');

INSERT INTO social_media_platform (platform_id, platform_name, platform_website, platform_description)
VALUES (platform_id_seq.nextval, 'Instagram', 'www.instagram.com', 'A photo and video sharing social networking platform where users can follow other users and explore content by hashtags and location tags.');

INSERT INTO social_media_platform (platform_id, platform_name, platform_website, platform_description)
VALUES (platform_id_seq.nextval, 'LinkedIn', 'www.linkedin.com', 'A social networking platform for professionals to connect, network, and find job opportunities.');

INSERT INTO social_media_platform (platform_id, platform_name, platform_website, platform_description)
VALUES (platform_id_seq.nextval, 'TikTok', 'www.tiktok.com', 'A social media platform for short-form mobile videos, where users can create and share videos with music, filters, and other effects.');

-- Social Media Accounts -- Insert

-- Facebook
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 1, 1, 'johndoe', 'https://www.facebook.com/johndoe', 10000, 'I am a lifestyle blogger based in New York.', 'Yes');

-- Twitter
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 2, 1, '@johndoe', 'https://twitter.com/johndoe', 5000, 'Lifestyle blogger based in New York. Tweets about food, travel, and fashion.', 'No');

-- Instagram
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 3, 1, '@johndoe', 'https://www.instagram.com/johndoe', 20000, 'Lifestyle blogger based in New York. Sharing my life with you, one photo at a time.', 'Yes');

-- LinkedIn
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 4, 1, 'johndoe', 'https://www.linkedin.com/in/johndoe', 1000, 'Experienced blogger and social media influencer with a passion for lifestyle and travel.', 'Yes');

-- TikTok
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 5, 1, '@johndoe', 'https://www.tiktok.com/@johndoe', 15000, 'Join me on my journey to explore the world, one short video at a time!', 'No');

-- Facebook
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 1, 2, 'jane.doe', 'https://www.facebook.com/jane.doe', 15000, 'I love sharing my life with you all through my blog!', 'No');

-- Twitter
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 2, 2, '@jane.doe', 'https://twitter.com/jane.doe', 8000, 'Lifestyle blogger based in New York. Tweets about food, travel, and fashion.', 'Yes');

-- Instagram
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 3, 2, '@jane.doe', 'https://www.instagram.com/jane.doe', 25000, 'Lifestyle blogger based in New York. Sharing my life with you, one photo at a time.', 'No');

-- LinkedIn
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 4, 2, 'jane.doe', 'https://www.linkedin.com/in/jane.doe', 1000, 'Experienced blogger and social media influencer with a passion for lifestyle and travel.', 'Yes');

-- TikTok
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 5, 2, '@jane.doe', 'https://www.tiktok.com/@jane.doe', 15000, 'Join me on my journey to explore the world, one short video at a time!', 'No');

-- Facebook
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 1, 3, 'adam.smith', 'https://www.facebook.com/adam.smith', 45000, 'I love sharing my life with you all through my blog!', 'No');

-- Twitter
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 2, 3, '@adam.smith', 'https://twitter.com/adam.smith', 18000, 'Lifestyle blogger based in New York. Tweets about food, travel, and fashion.', 'Yes');

-- Instagram
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 3, 3, '@adam.smith', 'https://www.instagram.com/adam.smith', 95000, 'Lifestyle blogger based in New York. Sharing my life with you, one photo at a time.', 'No');

-- LinkedIn
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 4, 3, 'adam.smith', 'https://www.linkedin.com/in/adam.smith', 4000, 'Experienced blogger and social media influencer with a passion for lifestyle and travel.', 'Yes');

-- TikTok
INSERT INTO social_media_account (social_media_account_id, platform_id, influncer_id, account_handle, account_url, followers, bio, verified)
VALUES (social_media_account_id_seq.nextval, 5, 3, '@adam.smith', 'https://www.tiktok.com/@adam.smith', 15500, 'Join me on my journey to explore the world, one short video at a time!', 'No');


--Campaigns

-- Campaigns for Apple
INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 1, 'iPhone 13 Launch', 'Promote the new iPhone 13 and increase sales', 'Tech enthusiasts and Apple loyalists', TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 1000000, 3);

INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 1, 'Holiday Gift Guide', 'Feature Apple products as must-have holiday gifts', 'Holiday shoppers', TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 500000, 2);

-- Campaigns for Amazon
INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 2, 'Prime Day 2023', 'Encourage Amazon Prime subscriptions and boost sales', 'Online shoppers', TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-07-11', 'YYYY-MM-DD'), 2000000, 3);

INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 2, 'Back-to-School Sale', 'Promote discounted school supplies and devices', 'Parents and students', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 1000000, 2);

-- Campaigns for Microsoft
INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 3, 'Windows 11 Launch', 'Promote the new Windows 11 operating system and increase upgrades', 'Businesses and PC users', TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 1500000, 3);

INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 3, 'Surface Pro Discount', 'Encourage sales of Surface Pro devices with limited-time discounts', 'Tech enthusiasts and professionals', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 500000, 2);

-- Campaigns for Facebook
INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 4, 'Holiday Greetings Ad', 'Spread holiday cheer and promote the Facebook platform', 'Facebook users', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 100000, 1);

INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 4, 'Facebook Marketplace Ads', 'Promote the Marketplace feature and increase sales', 'Online shoppers', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 500000, 2);

-- Campaigns for Alphabet (Google)
INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 5, 'Pixel 7 Launch', 'Promote the new Pixel 7 smartphone and increase sales', 'Tech enthusiasts and Android users', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 2000000, 3);

INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 5, 'Google Workspace Upgrade', 'Encourage businesses to upgrade to Google Workspace', 'Small and medium-sized businesses', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 1000000, 2);

INSERT INTO campaign(campaign_id, brand_id, campaign_name, campaign_objective, target_audience, start_date, end_date, budget, campaign_priority)
VALUES(campaign_id_seq.nextval, 5, 'Google Maps Ad Campaign', 'Promote the features and benefits of Google Maps', 'Travelers and drivers', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 500000, 1);


-- Campaign Posts:

-- Posts for iPhone 13 Launch campaign

INSERT INTO campaign_post (post_id, campaign_id, social_media_account_id, post_caption, post_image)
VALUES (post_id_seq.nextval, 1, 1, 'Introducing the iPhone 13 - the best iPhone yet! With a stunning new design, advanced camera system, and all-day battery life, its the perfect device for tech enthusiasts and Apple loyalists. Get yours today!', 'https://example.com/images/iphone-13-launch.png');

INSERT INTO campaign_post (post_id, campaign_id, social_media_account_id, post_caption, post_image)
VALUES (post_id_seq.nextval, 1, 1, 'Introducing the new iPhone 13 lineup!', 'https://example.com/iphone13.jpg');

INSERT INTO campaign_post (post_id, campaign_id, social_media_account_id, post_caption, post_image)
VALUES (post_id_seq.nextval, 1, 2, 'Experience the power of the iPhone 13 Pro', 'https://example.com/iphone13pro.jpg');

-- Posts for Holiday Gift Guide campaign

INSERT INTO campaign_post (post_id, campaign_id, social_media_account_id, post_caption, post_image)
VALUES (post_id_seq.nextval, 2, 1, 'Looking for the perfect holiday gift? Look no further than Apple! From the latest iPhone to the newest MacBook, we have got something for everyone on your list. Shop now and give the gift of innovation!', 'https://example.com/images/holiday-gift-guide.png');

INSERT INTO campaign_post (post_id, campaign_id, social_media_account_id, post_caption, post_image)
VALUES (post_id_seq.nextval, 2, 3, 'Surprise your loved ones with the perfect Apple gift this holiday season', 'https://example.com/holidaygifts.jpg');

INSERT INTO campaign_post (post_id, campaign_id, social_media_account_id, post_caption, post_image)
VALUES (post_id_seq.nextval, 2, 4, 'The best tech gifts are Apple products!', 'https://example.com/apple-gifts.jpg');


--Post Engagement:

-- Post engagement for Apple iPhone 13 Launch campaign, post 1
INSERT INTO post_engagement (post_id, likes, shares, comments, views, reach)
VALUES (1, 10000, 5000, 2000, 50000, 100000);

-- Post engagement for Apple iPhone 13 Launch campaign, post 2
INSERT INTO post_engagement (post_id, likes, shares, comments, views, reach)
VALUES (2, 5000, 2500, 1000, 25000, 50000);

-- Post engagement for Apple iPhone 13 Launch campaign, post 1
INSERT INTO post_engagement(post_id, likes, shares, comments, views, reach)
VALUES(3, 5000, 2000, 1000, 10000, 15000);

-- Post engagement for Apple iPhone 13 Launch campaign, post 2
INSERT INTO post_engagement(post_id, likes, shares, comments, views, reach)
VALUES(4, 10000, 5000, 2500, 20000, 30000);

-- Post engagement for Apple Holiday Gift Guide campaign, post 1
INSERT INTO post_engagement(post_id, likes, shares, comments, views, reach)
VALUES(5, 2000, 500, 100, 5000, 7500);

-- Post engagement for Apple Holiday Gift Guide campaign, post 2
INSERT INTO post_engagement(post_id, likes, shares, comments, views, reach)
VALUES(6, 5000, 1500, 500, 10000, 15000);

-- Campaign Performance:

-- iPhone 13 Launch campaign, Influencer 1
INSERT INTO campaign_performance (campaign_performance_id, influencer_id, campaign_id, clicks, impressions, engagement, posts_count, reach)
VALUES (campaign_performance_id_seq.nextval, 1, 1, 1000, 75000, 20000, 2, 150000);

-- iPhone 13 Launch campaign, Influencer 2
INSERT INTO campaign_performance (campaign_performance_id, influencer_id, campaign_id, clicks, impressions, engagement, posts_count, reach)
VALUES (campaign_performance_id_seq.nextval, 2, 1, 2500, 35000, 7500, 1, 50000);

-- Holiday Gift Guide campaign, Influencer 1
INSERT INTO campaign_performance (campaign_performance_id, influencer_id, campaign_id, clicks, impressions, engagement, posts_count, reach)
VALUES (campaign_performance_id_seq.nextval, 1, 2, 500, 10000, 2500, 1, 15000);

-- Holiday Gift Guide campaign, Influencer 3
INSERT INTO campaign_performance (campaign_performance_id, influencer_id, campaign_id, clicks, impressions, engagement, posts_count, reach)
VALUES (campaign_performance_id_seq.nextval, 3, 2, 1250, 17500, 4000, 1, 25000);