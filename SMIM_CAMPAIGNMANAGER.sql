
EXEC ADMIN.reset_seq('CAMPAIGN_ID_SEQ'); 
EXEC ADMIN.reset_data('CAMPAIGN');

-- Campaigns for Apple
EXEC ADMIN.campaign_manager_pkg.insert_campaign( 1, 'iPhone 13 Launch', 'Promote the new iPhone 13 and increase sales', 'Tech enthusiasts and Apple loyalists', TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 1000000, 3);

EXEC ADMIN.campaign_manager_pkg.insert_campaign( 1, 'Holiday Gift Guide', 'Feature Apple products as must-have holiday gifts', 'Holiday shoppers', TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 500000, 2);

-- Campaigns for Amazon
EXEC ADMIN.campaign_manager_pkg.insert_campaign( 2, 'Prime Day 2023', 'Encourage Amazon Prime subscriptions and boost sales', 'Online shoppers', TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-07-11', 'YYYY-MM-DD'), 2000000, 3);

EXEC ADMIN.campaign_manager_pkg.insert_campaign( 2, 'Back-to-School Sale', 'Promote discounted school supplies and devices', 'Parents and students', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 1000000, 2);

-- Campaigns for Microsoft
EXEC ADMIN.campaign_manager_pkg.insert_campaign( 3, 'Windows 11 Launch', 'Promote the new Windows 11 operating system and increase upgrades', 'Businesses and PC users', TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 1500000, 3);

EXEC ADMIN.campaign_manager_pkg.insert_campaign( 3, 'Surface Pro Discount', 'Encourage sales of Surface Pro devices with limited-time discounts', 'Tech enthusiasts and professionals', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 500000, 2);

-- Campaigns for Facebook
EXEC ADMIN.campaign_manager_pkg.insert_campaign( 4, 'Holiday Greetings Ad', 'Spread holiday cheer and promote the Facebook platform', 'Facebook users', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 100000, 1);

EXEC ADMIN.campaign_manager_pkg.insert_campaign( 4, 'Facebook Marketplace Ads', 'Promote the Marketplace feature and increase sales', 'Online shoppers', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 500000, 2);

-- Campaigns for Alphabet (Google)
EXEC ADMIN.campaign_manager_pkg.insert_campaign( 5, 'Pixel 7 Launch', 'Promote the new Pixel 7 smartphone and increase sales', 'Tech enthusiasts and Android users', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 2000000, 3);

EXEC ADMIN.campaign_manager_pkg.insert_campaign( 5, 'Google Workspace Upgrade', 'Encourage businesses to upgrade to Google Workspace', 'Small and medium-sized businesses', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 1000000, 2);

EXEC ADMIN.campaign_manager_pkg.insert_campaign( 5, 'Google Maps Ad Campaign', 'Promote the features and benefits of Google Maps', 'Travelers and drivers', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 500000, 1);


