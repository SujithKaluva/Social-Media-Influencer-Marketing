EXEC ADMIN.reset_seq('BRAND_ID_SEQ'); 
EXEC ADMIN.reset_seq('SKILL_ID_SEQ'); 
EXEC ADMIN.reset_seq('PLATFORM_ID_SEQ'); 
EXEC ADMIN.reset_data('brand');
EXEC ADMIN.reset_data('skill');
EXEC ADMIN.reset_data('social_media_platform');
--Inserting Brands

-- Brand 1

EXEC ADMIN.app_admin_pkg.insert_brand('Apple','Tim Cook','Cupertino, California','apple.com','tim@apple.com');
EXEC ADMIN.app_admin_pkg.insert_brand('Amazon','Andy Jassy','Seattle, Washington','amazon.com','ajassy@amazon.com');
EXEC ADMIN.app_admin_pkg.insert_brand('Microsoft','Satya Nadella','Redmond, Washington','microsoft.com','satyan@microsoft.com');
EXEC ADMIN.app_admin_pkg.insert_brand('Facebook','Mark Zuckerberg','Menlo Park, California','facebook.com','zuck@fb.com');
EXEC ADMIN.app_admin_pkg.insert_brand('Alphabet','Sundar Pichai','Mountain View, California','abc.xyz','sundar@google.com');
  -- Brand 6
EXEC ADMIN.app_admin_pkg.insert_brand('Tesla','Elon Musk','Palo Alto, California','tesla.com','elon@tesla.com');

-- Brand 7
EXEC ADMIN.app_admin_pkg.insert_brand('Netflix','Reed Hastings','Los Gatos, California','netflix.com','reed@netflix.com');

-- Brand 8
EXEC ADMIN.app_admin_pkg.insert_brand('Walmart','Doug McMillon','Bentonville, Arkansas','walmart.com','doug.mcmillon@walmart.com');

-- Brand 9
EXEC ADMIN.app_admin_pkg.insert_brand('Procter and Gamble','David Taylor','Cincinnati, Ohio','pg.com','david.taylor@pg.com');

-- Brand 10
EXEC ADMIN.app_admin_pkg.insert_brand('Johnson and Johnson','Alex Gorsky','New Brunswick, New Jersey','jnj.com','agorsky@jnj.com');

-- Brand 11
EXEC ADMIN.app_admin_pkg.insert_brand('Nike','John Donahoe','Beaverton, Oregon','nike.com','john.donahoe@nike.com');

-- Brand 12
EXEC ADMIN.app_admin_pkg.insert_brand('PepsiCo','Ramon Laguarta','Purchase, New York','pepsico.com','ramon.laguarta@pepsico.com');

-- Brand 13
EXEC ADMIN.app_admin_pkg.insert_brand('Unilever','Alan Jope','London, United Kingdom','unilever.com','alan.jope@unilever.com');

-- Brand 14
EXEC ADMIN.app_admin_pkg.insert_brand('Coca-Cola','James Quincey','Atlanta, Georgia','coca-cola.com','jquincey@coca-cola.com');

-- Brand 15
EXEC ADMIN.app_admin_pkg.insert_brand('BMW','Oliver Zipse','Munich, Germany','bmw.com','oliver.zipse@bmw.com');

-- Brand 16
EXEC ADMIN.app_admin_pkg.insert_brand('Mercedes-Benz','Ola Källenius','Stuttgart, Germany','mercedes-benz.com','ola.kallenius@daimler.com');

-- Brand 17
EXEC ADMIN.app_admin_pkg.insert_brand('Samsung','Kim Ki-nam','Seoul, South Korea','samsung.com','kkn@samsung.com');

-- Brand 18
EXEC ADMIN.app_admin_pkg.insert_brand('Toyota','Akio Toyoda','Toyota City, Japan','toyota.com','akio.toyoda@toyota.com');

-- Brand 19
EXEC ADMIN.app_admin_pkg.insert_brand('Ford','Jim Farley','Dearborn, Michigan','ford.com','jfarley@ford.com');

-- Brand 20
EXEC ADMIN.app_admin_pkg.insert_brand('McDonalds','Chris Kempczinski','Chicago, Illinois','mcdonalds.com','chris.kempczinski@mcd.com');

-- Brand 21
EXEC ADMIN.app_admin_pkg.insert_brand('General Electric','H. Lawrence Culp Jr.','Boston, Massachusetts','ge.com','larry.culp@ge.com');

-- Brand 22
EXEC ADMIN.app_admin_pkg.insert_brand('IBM','Arvind Krishna','Armonk, New York','ibm.com','arvind.krishna@ibm.com');

-- Brand 23
EXEC ADMIN.app_admin_pkg.insert_brand('Bayer','Werner Baumann','Leverkusen, Germany','bayer.com','werner.baumann@bayer.com');

-- Brand 24
EXEC ADMIN.app_admin_pkg.insert_brand('Nissan','Makoto Uchida','Yokohama, Japan','nissan-global.com','makoto.uchida@nissan.co.jp');

-- Brand 25
EXEC ADMIN.app_admin_pkg.insert_brand('DHL','John Pearson','Bonn, Germany','dhl.com','john.pearson@dhl.com');

-- Brand 26
EXEC ADMIN.app_admin_pkg.insert_brand('LOréal','Nicolas Hieronimus','Clichy, France','loreal.com','nicolas.hieronimus@loreal.com');

-- Brand 27
EXEC ADMIN.app_admin_pkg.insert_brand('Chevron Corporation','Michael Wirth','San Ramon, California','chevron.com','michael.k.wirth@chevron.com');

-- Brand 28
EXEC ADMIN.app_admin_pkg.insert_brand('Nestlé','Mark Schneider','Vevey, Switzerland','nestle.com','mark.schneider@nestle.com');

-- Brand 29
EXEC ADMIN.app_admin_pkg.insert_brand('Sony','Kenichiro Yoshida','Tokyo, Japan','sony.com','kenichiro.yoshida@sony.com');

-- Brand 30
EXEC ADMIN.app_admin_pkg.insert_brand('Intel Corporation','Patrick Gelsinger','Santa Clara, California','intel.com','patrick.gelsinger@intel.com');

-- Brand 31
EXEC ADMIN.app_admin_pkg.insert_brand('LOccitane en Provence','Reinold Geiger','Manosque, France','loccitane.com','reinold.geiger@loccitane.com');

-- Brand 32
EXEC ADMIN.app_admin_pkg.insert_brand('Delta Air Lines','Ed Bastian','Atlanta, Georgia','delta.com','ed.bastian@delta.com');

-- Brand 33
EXEC ADMIN.app_admin_pkg.insert_brand('Novartis','Vas Narasimhan','Basel, Switzerland','novartis.com','vas.narasimhan@novartis.com');

-- Brand 34
EXEC ADMIN.app_admin_pkg.insert_brand('Marriott International','Anthony Capuano','Bethesda, Maryland','marriott.com','anthony.capuano@marriott.com');


-- Inserting Skills

-- skills for Apple influencers
EXEC ADMIN.app_admin_pkg.insert_skill ( 'Tech Reviews', 'Providing reviews of Apple products or discussing tech news');

EXEC ADMIN.app_admin_pkg.insert_skill ( 'App Development', 'Developing apps for iOS or discussing app development tips and trends');

EXEC ADMIN.app_admin_pkg.insert_skill ( 'Apple Accessories', 'Promoting Apple accessories or providing content about Apple accessories');

EXEC ADMIN.app_admin_pkg.insert_skill ( 'Apple Music', 'Promoting Apple Music or providing content related to music and the music industry');

EXEC ADMIN.app_admin_pkg.insert_skill ( 'Apple Events', 'Providing live coverage or highlights of Apple events or discussing Apple event predictions');

-- skills for Nike influencers
EXEC ADMIN.app_admin_pkg.insert_skill ( 'Athletic Training', 'Providing athletic training tips or promoting athletic training products');

EXEC ADMIN.app_admin_pkg.insert_skill ( 'Sports Nutrition', 'Providing nutrition tips or promoting nutrition products for athletes');

-- skills for Adidas influencers
EXEC ADMIN.app_admin_pkg.insert_skill ( 'Sportswear Design', 'Designing sportswear or promoting sportswear products');

EXEC ADMIN.app_admin_pkg.insert_skill ( 'Sneaker Culture', 'Promoting sneaker culture or providing content related to sneakers');

-- skills for Coca-Cola influencers
EXEC ADMIN.app_admin_pkg.insert_skill ( 'Beverage Promotion', 'Promoting Coca-Cola beverages or providing beverage-related content');

EXEC ADMIN.app_admin_pkg.insert_skill ( 'Video Production', 'Creating video content for social media platforms');


--Social Media Platforms -- Insert

EXEC ADMIN.app_admin_pkg.insert_social_media_platform('Facebook', 'www.facebook.com', 'A social networking website where users can connect with friends and family, and join groups to share common interests.');

EXEC ADMIN.app_admin_pkg.insert_social_media_platform('Twitter', 'www.twitter.com', 'A microblogging and social networking platform where users can share short messages and follow other users.');

EXEC ADMIN.app_admin_pkg.insert_social_media_platform('Instagram', 'www.instagram.com', 'A photo and video sharing social networking platform where users can follow other users and explore content by hashtags and location tags.');

EXEC ADMIN.app_admin_pkg.insert_social_media_platform('LinkedIn', 'www.linkedin.com', 'A social networking platform for professionals to connect, network, and find job opportunities.');

EXEC ADMIN.app_admin_pkg.insert_social_media_platform('TikTok', 'www.tiktok.com', 'A social media platform for short-form mobile videos, where users can create and share videos with music, filters, and other effects.');
