-- Inserting Influencers
EXEC ADMIN.reset_seq('INFLUENCER_ID_SEQ'); 
EXEC ADMIN.reset_seq('SOCIAL_MEDIA_ACCOUNT_ID_SEQ'); 
EXEC ADMIN.reset_seq('POST_ID_SEQ'); 
EXEC ADMIN.reset_data('CAMPAIGN_PERFORMANCE');
EXEC ADMIN.reset_data('POST_ENGAGEMENT');
EXEC ADMIN.reset_data('campaign_post');
EXEC ADMIN.reset_data('social_media_account');
EXEC ADMIN.reset_data('influencer_skill');
EXEC ADMIN.reset_data('INFLUENCER');

EXECUTE ADMIN.social_media_influencer_pkg.insert_influencer( 'John', 'Doe', 'New York', 'john.doe122@gmail.com', '123-456-7890', 'Male');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'Jane', 'Doe', 'Los Angeles', 'jane.doe28728@gmail.com', '234-567-8901', 'Female');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'Adam', 'Smith', 'London', 'adam.smith3@gmail.com', '345-678-9012', 'Male');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'Eve', 'Smith', 'Paris', 'eve.smith4@gmail.com', '456-789-0123', 'Female');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'Jack', 'Jones', 'Toronto', 'jack.jones5@gmail.com', '567-890-1234', 'Male');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'Jill', 'Jones', 'Sydney', 'jill.jones6@gmail.com', '678-901-2345', 'Female');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'Peter', 'Park', 'Seoul', 'peter.park7@gmail.com', '789-012-3456', 'Male');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'Mary', 'Park', 'Tokyo', 'mary.park8@gmail.com', '890-123-4567', 'Female');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'David', 'Lee', 'Hong Kong', 'david.lee9@gmail.com', '901-234-5678', 'Male');

EXEC ADMIN.social_media_influencer_pkg.insert_influencer( 'Anna', 'Lee', 'Singapore', 'anna.lee10@gmail.com', '012-345-6789', 'Female');

--Influencer Skills Mapping
-- Influencer 1

EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill(1, 2);
-- Tech Reviews
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (2, 1); 
-- App Development

-- Influencer 2
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (3, 2); 
-- Apple Accessories
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (4, 2); 
-- Apple Music

-- Influencer 3
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (1, 3); 
-- Tech Reviews
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (5, 3); 
-- Apple Events

-- Influencer 4
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (2, 4); 
-- App Development
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (3, 4); 
-- Apple Accessories

-- Influencer 5
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (1, 5); 
-- Tech Reviews
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (4, 5); 
-- Apple Music

-- Influencer 6
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (2, 6); 
-- App Development
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (5, 6); 
-- Apple Events

-- Influencer 7
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (1, 7); 
-- Tech Reviews
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (3, 7); 
-- Apple Accessories

-- Influencer 8
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (4, 8); 
-- Apple Music
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (5, 8); 
-- Apple Events

-- Influencer 9
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (1, 9); 
-- Tech Reviews
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (2, 9); 
-- App Development

-- Influencer 10
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (3, 10); 
-- Apple Accessories
EXEC ADMIN.social_media_influencer_pkg.insert_influencer_skill (4, 10); 
-- Apple Music


-- Facebook

EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account( 1, 1, 'johndoe', 'https://www.facebook.com/johndoe', 10000, 'I am a lifestyle blogger based in New York.', 'Yes');

-- Twitter
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 2, 1, '@johndoe', 'https://twitter.com/johndoe', 5000, 'Lifestyle blogger based in New York. Tweets about food, travel, and fashion.', 'No');

-- Instagram
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 3, 1, '@johndoe', 'https://www.instagram.com/johndoe', 20000, 'Lifestyle blogger based in New York. Sharing my life with you, one photo at a time.', 'Yes');

-- LinkedIn
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 4, 1, 'johndoe', 'https://www.linkedin.com/in/johndoe', 1000, 'Experienced blogger and social media influencer with a passion for lifestyle and travel.', 'Yes');

-- TikTok
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 5, 1, '@johndoe', 'https://www.tiktok.com/@johndoe', 15000, 'Join me on my journey to explore the world, one short video at a time!', 'No');

-- Facebook
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 1, 2, 'jane.doe', 'https://www.facebook.com/jane.doe', 15000, 'I love sharing my life with you all through my blog!', 'No');

-- Twitter
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 2, 2, '@jane.doe', 'https://twitter.com/jane.doe', 8000, 'Lifestyle blogger based in New York. Tweets about food, travel, and fashion.', 'Yes');

-- Instagram
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 3, 2, '@jane.doe', 'https://www.instagram.com/jane.doe', 25000, 'Lifestyle blogger based in New York. Sharing my life with you, one photo at a time.', 'No');

-- LinkedIn
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 4, 2, 'jane.doe', 'https://www.linkedin.com/in/jane.doe', 1000, 'Experienced blogger and social media influencer with a passion for lifestyle and travel.', 'Yes');

-- TikTok
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 5, 2, '@jane.doe', 'https://www.tiktok.com/@jane.doe', 15000, 'Join me on my journey to explore the world, one short video at a time!', 'No');

-- Facebook
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 1, 3, 'adam.smith', 'https://www.facebook.com/adam.smith', 45000, 'I love sharing my life with you all through my blog!', 'No');

-- Twitter
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 2, 3, '@adam.smith', 'https://twitter.com/adam.smith', 18000, 'Lifestyle blogger based in New York. Tweets about food, travel, and fashion.', 'Yes');

-- Instagram
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 3, 3, '@adam.smith', 'https://www.instagram.com/adam.smith', 95000, 'Lifestyle blogger based in New York. Sharing my life with you, one photo at a time.', 'No');

-- LinkedIn
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 4, 3, 'adam.smith', 'https://www.linkedin.com/in/adam.smith', 4000, 'Experienced blogger and social media influencer with a passion for lifestyle and travel.', 'Yes');

-- TikTok
EXEC ADMIN.social_media_influencer_pkg.insert_social_media_account ( 5, 3, '@adam.smith', 'https://www.tiktok.com/@adam.smith', 15500, 'Join me on my journey to explore the world, one short video at a time!', 'No');

-- Posts for iPhone 13 Launch campaign

EXEC ADMIN.social_media_influencer_pkg.insert_campaign_post( 1, 1, 'Introducing the iPhone 13 - the best iPhone yet! With a stunning new design, advanced camera system, and all-day battery life, its the perfect device for tech enthusiasts and Apple loyalists. Get yours today!', 'https://example.com/images/iphone-13-launch.png');

EXEC ADMIN.social_media_influencer_pkg.insert_campaign_post( 1, 1, 'Introducing the new iPhone 13 lineup!', 'https://example.com/iphone13.jpg');

EXEC ADMIN.social_media_influencer_pkg.insert_campaign_post( 1, 2, 'Experience the power of the iPhone 13 Pro', 'https://example.com/iphone13pro.jpg');

-- Posts for Holiday Gift Guide campaign

EXEC ADMIN.social_media_influencer_pkg.insert_campaign_post( 2, 1, 'Looking for the perfect holiday gift? Look no further than Apple! From the latest iPhone to the newest MacBook, we have got something for everyone on your list. Shop now and give the gift of innovation!', 'https://example.com/images/holiday-gift-guide.png');

EXEC ADMIN.social_media_influencer_pkg.insert_campaign_post( 2, 3, 'Surprise your loved ones with the perfect Apple gift this holiday season', 'https://example.com/holidaygifts.jpg');

EXEC ADMIN.social_media_influencer_pkg.insert_campaign_post( 2, 4, 'The best tech gifts are Apple products!', 'https://example.com/apple-gifts.jpg');