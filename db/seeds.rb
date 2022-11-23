# Create categories
latests = Category.create(name: 'latests') # id = 1
beachfront = Category.create(name: 'beachfront') # id = 2
mansions = Category.create(name: 'mansions') # 3
lakefront = Category.create(name: 'lakefront') # 4
amazing_views = Category.create(name: 'amazing views') # 5
countryside = Category.create(name: 'countryside') # 6
tiny_homes = Category.create(name: 'tiny homes') # 7
iconic_cities = Category.create(name: 'iconic cities') # 8
luxe = Category.create(name: 'luxe') # 9
surfing = Category.create(name: 'surfing') # 10
skiing = Category.create(name: 'skiing') # 11
houseboats = Category.create(name: 'houseboats') # 12
desert = Category.create(name: 'desert') # 13
historical_homes = Category.create(name: 'historical homes') # 14
beach = Category.create(name: 'beach') # 15
castles = Category.create(name: 'castles') # 16

# Create users
admin = User.create(name: 'Mr Admin', email: 'admin@test.com', password: '123123', role: 1) # 1
david = User.create(name: 'David Verde', email: 'david@gmail.com', password: '123456') # 2
gabriel = User.create(name: 'Gabriel Santo', email: 'gabriel@test.com', password: '123123') # 3
Luke = User.create(name: 'Luke Stamford', email: 'luke@test.com', password: '123123') # 4
Gil = User.create(name: 'Gil Gray', email: 'gil@test.com', password: '123123') # 5
Ann = User.create(name: 'Ann  Something', email: 'ann@test.com', password: '123123') # 6
Sandra = User.create(name: 'Sandra  Rodriguez', email: 'sandra@test', password: '123123') # 7
Mitten = User.create(name: 'Mitten White', email: 'mitten@test.com', password: '123123') # 8
Conan = User.create(name: 'Conan Silva', email: 'conan@test.com', password: '123123') # 9

# Create the Luxury Beachfront Six Palms Villas property
luxury_property_address = Address.create(street: 'Unknown', city: 'Rocky Point', country: 'Mexico', zip_code: '111111', number: 1, continent: 'North America') # id = 1

luxury_property = Property.create(
  name: 'Luxury Beachfront Six Palms Villas # 1',
  description: 'This is the house perfect for you! Near to the beach, to markets, gyms, etc. Reserve a date!',
  guest_capacity: 9,
  bedrooms: 3,
  beds: 5,
  baths: 3,
  kind: 'house',
  size: 690,
  address_id: 1,
  user_id: 3,
  is_public: true
)

PropertyImage.create(property_id: 1, source: 'https://i.ibb.co/XpgGTmY/62ad847e-2f84-49cb-a8a7-35856dc93a20.webp')
PropertyImage.create(property_id: 1, source: 'https://i.ibb.co/103Qnyr/d88dfa7d-113a-4e26-b3fd-d819df85a446.webp')
PropertyImage.create(property_id: 1, source: 'https://i.ibb.co/N7rfLcs/c7ec5fd9-ae03-40f9-9632-9ce1a77a3df2.webp')
PropertyImage.create(property_id: 1, source: 'https://i.ibb.co/2j0Kvgy/6513c49a-7537-4175-be57-f7581f393b43.webp')
PropertyImage.create(property_id: 1, source: 'https://i.ibb.co/CJnmm8J/492ee2ac-55f8-4c50-8f72-877cc0aa784f.webp')
PropertyImage.create(property_id: 1, source: 'https://i.ibb.co/vz1Nrkj/70e4749a-e369-4807-9cfd-a1c344ccf847.webp')
PropertyImage.create(property_id: 1, source: 'https://i.ibb.co/hXWm9Cm/d62454a1-c7e9-4550-bd56-478cf3d09b65.webp')
PropertyImage.create(property_id: 1, source: 'https://i.ibb.co/nj5Kd7c/2e505f86-c67c-4353-a542-5ea1eab24f51.webp')

PropertyCategory.create(property_id: 1, category_id: 2)
PropertyCategory.create(property_id: 1, category_id: 3)
PropertyCategory.create(property_id: 1, category_id: 9)
PropertyCategory.create(property_id: 1, category_id: 15)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 3,
  rate: 365,
  user_id: 3,
  property_id: 1
)
Hosting.create(
  cycle: 1,
  minimum_cycle_amount: 1,
  rate: 2415,
  user_id: 3,
  property_id: 1
)

BlockedPeriod.create(
  start_date: '2022-11-20',
  end_date: '2022-11-25',
  property_id: 1
)
BlockedPeriod.create(
  start_date: '2023-01-01',
  end_date: '2023-01-08',
  property_id: 1
)

# Create the Iconic Glass Mansion - Huge Views - Best Location Property
glass_mansion_address = Address.create(street: 'Unknown', city: 'Osage Beach', country: 'USA', zip_code: '111112', number: 2, continent: 'North America') # id = 2

glass_mansion = Property.create(
  name: 'Iconic Glass Mansion - Huge Views - Best Location',
  description: 'The iconic and luxurious Glass Mansion has awe-inspiring, expansive lake views for miles from almost every room.\n It is located directly in the heart of Lake of the Ozarks in Osage Beach, yet is securely and privately tucked away in the prestigious gated Ledges Waterfront Homes neighborhood. Glass Mansion sits on the main channel of the lake directly on the water at the 20 mile marker, perched on beautiful natural rock cliffs with cascading waterfalls into the lake below.',
  guest_capacity: 16,
  bedrooms: 5,
  beds: 10,
  baths: 5,
  kind: 'house',
  size: 1200,
  is_public: true,
  address_id: 2,
  user_id: 3
)

PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/XpgGTmY/62ad847e-2f84-49cb-a8a7-35856dc93a20.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/103Qnyr/d88dfa7d-113a-4e26-b3fd-d819df85a446.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/N7rfLcs/c7ec5fd9-ae03-40f9-9632-9ce1a77a3df2.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/2j0Kvgy/6513c49a-7537-4175-be57-f7581f393b43.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/CJnmm8J/492ee2ac-55f8-4c50-8f72-877cc0aa784f.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/vz1Nrkj/70e4749a-e369-4807-9cfd-a1c344ccf847.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/hXWm9Cm/d62454a1-c7e9-4550-bd56-478cf3d09b65.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/nj5Kd7c/2e505f86-c67c-4353-a542-5ea1eab24f51.webp')

PropertyCategory.create(property_id: 2, category_id: 2)
PropertyCategory.create(property_id: 2, category_id: 3)
PropertyCategory.create(property_id: 2, category_id: 9)
PropertyCategory.create(property_id: 2, category_id: 15)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 3,
  rate: 365,
  user_id: 3,
  property_id: 2
)
Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 2,
  rate: 370,
  user_id: 3,
  property_id: 2
)

BlockedPeriod.create(
  start_date: '2022, 11, 15',
  end_date: '2022, 11, 25',
  property_id: 2
)
BlockedPeriod.create(
  start_date: '2023, 01, 01',
  end_date: '2023, 01, 03',
  property_id: 2
)
BlockedPeriod.create(
  start_date: '2023, 01, 08',
  end_date: '2023, 01, 25',
  property_id: 2
)

# Create Luxury Beachfront Six Palms Villas # 1 Property
six_palms_villas_address = Address.create(street: 'Unknown', city: 'Rocky Point', country: 'Mexico', zip_code: '111113', number: 3, continent: 'North America') # id = 3

six_palms_villas = Property.create(
  name: 'Luxury Beachfront Six Palms Villas # 1',
  description:
  'This is the house perfect for you! Near to the beach, to markets, gyms, etc. Reserve a date!',
  guest_capacity: 9,
  bedrooms: 3,
  beds: 5,
  baths: 3,
  kind: 'house',
  size: 690,
  is_public: true,
  address_id: 3,
  user_id: 3
)

PropertyImage.create(property_id: 3, source: 'https://i.ibb.co/XpgGTmY/62ad847e-2f84-49cb-a8a7-35856dc93a20.webp')
PropertyImage.create(property_id: 3, source: 'https://i.ibb.co/N7rfLcs/c7ec5fd9-ae03-40f9-9632-9ce1a77a3df2.webp')
PropertyImage.create(property_id: 3, source: 'https://i.ibb.co/2j0Kvgy/6513c49a-7537-4175-be57-f7581f393b43.webp')
PropertyImage.create(property_id: 3, source: 'https://i.ibb.co/CJnmm8J/492ee2ac-55f8-4c50-8f72-877cc0aa784f.webp')
PropertyImage.create(property_id: 3, source: 'https://i.ibb.co/vz1Nrkj/70e4749a-e369-4807-9cfd-a1c344ccf847.webp')
PropertyImage.create(property_id: 3, source: 'https://i.ibb.co/hXWm9Cm/d62454a1-c7e9-4550-bd56-478cf3d09b65.webp')
PropertyImage.create(property_id: 3, source: 'https://i.ibb.co/nj5Kd7c/2e505f86-c67c-4353-a542-5ea1eab24f51.webp')
PropertyImage.create(property_id: 3, source: 'https://i.ibb.co/103Qnyr/d88dfa7d-113a-4e26-b3fd-d819df85a446.webp')

PropertyCategory.create(property_id: 3, category_id: 2)
PropertyCategory.create(property_id: 3, category_id: 3)
PropertyCategory.create(property_id: 3, category_id: 9)
PropertyCategory.create(property_id: 3, category_id: 15)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 3,
  rate: 365,
  user_id: 3,
  property_id: 3
)

BlockedPeriod.create(
  start_date: '2022, 11, 15',
  end_date: '2022, 11, 25',
  property_id: 3
)
BlockedPeriod.create(
  start_date: '2023, 01, 01',
  end_date: '2023, 01, 03',
  property_id: 3
)
BlockedPeriod.create(
  start_date: '2023, 01, 08',
  end_date: '2023, 01, 25',
  property_id: 3
)

# Create Iconic Glass Mansion - Huge Views - Best Location Property
glass_mansion_address = Address.create(street: 'Unknown', city: 'Osage Beach', country: 'USA', zip_code: '111114', number: 4, continent: 'North America') # id = 4

glass_mansion = Property.create(
  name: 'Iconic Glass Mansion - Huge Views - Best Location',
  description: 'This is the house perfect for you! Near to the beach, to markets, gyms, etc. Reserve a date!',
  guest_capacity: 16,
  bedrooms: 5,
  beds: 10,
  baths: 5,
  kind: 'house',
  size: 1200,
  is_public: true,
  address_id: 4,
  user_id: 4
)

PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/N35JMr8/abfdccee-b6d6-4465-89e9-6625482abeb7.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/kxmf2cb/db6f128c-e396-4835-944d-ce71b66e7dc0.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/mvtfrWB/99038ba2-d090-4533-b234-607d20d26000.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/4FbXqYK/693f98b2-4635-466f-becf-d84cd41150bd.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/26stvN0/431cc039-8c82-417b-95d1-cb4cb4d214dc.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/GkY2GCQ/3f021541-b841-4ac5-9af0-e28cf0f484a2.webp')
PropertyImage.create(property_id: 2, source: 'https://i.ibb.co/BZ7QHKX/01ee453c-b5ac-467a-8c4f-c5eb699f1232.webp')

PropertyCategory.create(property_id: 4, category_id: 2)
PropertyCategory.create(property_id: 4, category_id: 3)
PropertyCategory.create(property_id: 4, category_id: 9)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 1,
  rate: 459.99,
  user_id: 4,
  property_id: 4
)

Hosting.create(
  cycle: 2,
  minimum_cycle_amount: 1,
  rate: 10_000,
  user_id: 4,
  property_id: 4
)

BlockedPeriod.create(
  start_date: '2022, 11, 15',
  end_date: '2022, 11, 25',
  property_id: 4
)

BlockedPeriod.create(
  start_date: '2023, 01, 01',
  end_date: '2023, 01, 03',
  property_id: 4
)

BlockedPeriod.create(
  start_date: '2023, 01, 08',
  end_date: '2023, 01, 25',
  property_id: 4
)

# Create Beachfront Malibu Retreat Property
beachfront_address = Address.create(street: 'Unknown', city: 'Malibu', country: 'USA', zip_code: '111115', number: 5, continent: 'North America') # id = 5

beachfront = Property.create(
  name: 'Beachfront Malibu Retreat',
  description: 'This is the house perfect for you! Near to the beach, to markets, gyms, etc. Reserve a date!',
  guest_capacity: 2,
  bedrooms: 1,
  beds: 1,
  baths: 1,
  kind: 'apartment',
  size: 60,
  is_public: true,
  address_id: 5,
  user_id: 5
)

PropertyImage.create(property_id: 5, source: 'https://i.ibb.co/P98xkTQ/56fe9e3f-48c1-4777-a2b0-5b7745eb9874.webp')
PropertyImage.create(property_id: 5, source: 'https://i.ibb.co/d5m1dSm/ad0164c8-acb5-477d-b1d0-19fabd9931cc.webp')
PropertyImage.create(property_id: 5, source: 'https://i.ibb.co/Fs7Zy8v/6861fc2a-ca6b-473a-b64d-7303f3836584.webp')
PropertyImage.create(property_id: 5, source: 'https://i.ibb.co/0n8T0MP/90f625f1-67e9-4a62-8e10-554ae12c8763.webp')
PropertyImage.create(property_id: 5, source: 'https://i.ibb.co/3FTr5tY/8ce69729-b8bd-41a4-83a5-383448dd0e80.webp')

PropertyCategory.create(property_id: 5, category_id: 2)
PropertyCategory.create(property_id: 5, category_id: 15)
PropertyCategory.create(property_id: 5, category_id: 5)
PropertyCategory.create(property_id: 5, category_id: 10)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 2,
  rate: 700,
  user_id: 5,
  property_id: 5
)

Hosting.create(
  cycle: 1,
  minimum_cycle_amount: 2,
  rate: 700,
  user_id: 5,
  property_id: 5
)

BlockedPeriod.create(
  start_date: '2022, 11, 15',
  end_date: '2022, 11, 25',
  property_id: 5
)

BlockedPeriod.create(
  start_date: '2023, 01, 01',
  end_date: '2023, 01, 03',
  property_id: 5
)

BlockedPeriod.create(
  start_date: '2023, 01, 08',
  end_date: '2023, 01, 25',
  property_id: 5
)

# Create Songbird Studio- Secluded but close to everything! Property

songbird_address = Address.create(street: 'Unknown', city: 'Brewster', country: 'USA', zip_code: '111115', number: 6, continent: 'North America') # id = 6

songbird = Property.create(
  name: 'Songbird Studio- Secluded but close to everything!',
  description: 'Bright, sunny, secluded, green 600 sqft studio apartment at rear of Antique home in the heart of Brewster, Northside of Rt 6A. Private entrance. Private backyard with lawn & gardens. Small private deck, gas grill. Bird and small animal life abounds outside. Tons of stars at night.. salt air on the wind. Walking distance to coffee shop, convenience store, multiple restaurants, Bike Trail. Short ride to bay beaches, easy drive to Ocean beaches. Gas "woodstove" for heat, AC for cooling, be comfy!',
  guest_capacity: 4,
  bedrooms: 1,
  beds: 2,
  baths: 1,
  kind: 'house',
  size: 80,
  is_public: true,
  address_id: 6,
  user_id: 6
)

PropertyImage.create(property_id: 6, source: 'https://i.ibb.co/3kPZW0f/3c0dfe9f-6df6-467a-9c80-4edbfe5dc61d.webp')
PropertyImage.create(property_id: 6, source: 'https://i.ibb.co/mByxRD3/b7079a51-dd6a-476a-b313-ba8589c534a0.webp')

PropertyCategory.create(property_id: 6, category_id: 6)
PropertyCategory.create(property_id: 6, category_id: 7)

Hosting.create(
  cycle: 2,
  minimum_cycle_amount: 6,
  rate: 2000,
  user_id: 6,
  property_id: 6
)

Hosting.create(
  cycle: 1,
  minimum_cycle_amount: 6,
  rate: 200,
  user_id: 6,
  property_id: 6
)

BlockedPeriod.create(
  start_date: '2022, 11, 15',
  end_date: '2022, 11, 25',
  property_id: 6
)

BlockedPeriod.create(
  start_date: '2023, 01, 01',
  end_date: '2023, 01, 03',
  property_id: 6
)

BlockedPeriod.create(
  start_date: '2023, 01, 08',
  end_date: '2023, 01, 25',
  property_id: 6
)

# Create Provenza Life 1002- Gorgeus apartment/gym Property

provenza_address = Address.create(street: 'Unknown', city: 'Medellin', country: 'Colombia', zip_code: '111115', number: 7, continent: 'South America') # id = 7

provenza = Property.create(
  name: 'Provenza Life 1002- Gorgeus apartment/gym',
  description:
      'This special place is close to everything, making it easy to plan your visit and move around while enjoying your trip.\n Only has 1 AC in the main room',
  guest_capacity: 2,
  bedrooms: 1,
  beds: 1,
  baths: 2,
  kind: 'apartment',
  size: 55,
  is_public: true,
  address_id: 7,
  user_id: 7
)

PropertyImage.create(property_id: 7, source: 'https://i.ibb.co/y4hsHMP/0451b654-545c-40e9-9416-458399129abf.webp')

PropertyCategory.create(property_id: 7, category_id: 8)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 2,
  rate: 100,
  user_id: 7,
  property_id: 7
)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 2,
  rate: 100,
  user_id: 7,
  property_id: 7
)

Hosting.create(
  cycle: 2,
  minimum_cycle_amount: 2,
  rate: 2800,
  user_id: 7,
  property_id: 7
)

BlockedPeriod.create(
  start_date: '2022, 11, 15',
  end_date: '2022, 11, 25',
  property_id: 7
)

BlockedPeriod.create(
  start_date: '2023, 01, 01',
  end_date: '2023, 01, 03',
  property_id: 7
)

BlockedPeriod.create(
  start_date: '2023, 01, 08',
  end_date: '2023, 01, 25',
  property_id: 7
)

# Create 2BR Suite @ The Grand Castle | Pool/Gym/Parking Property

grand_castle_address = Address.create(street: 'Unknown', city: 'Grandville', country: 'USA', zip_code: '111115', number: 8, continent: 'North America') # id = 8

grand_castle = Property.create(
  name: '2BR Suite @ The Grand Castle | Pool/Gym/Parking',
  description:
      'Featuring authentic architecture, high-end finishes, and attractive amenities, The Grand Castle is a unique experience for the entire family. Designed after the Neuschwanstein Castle in southwest Bavaria, the 15 story Grand Castle is the 2nd largest castle structure in the world. The kids will love the outdoor heated pool, game room, and Beauty and the Beast replicate library. Located just 30 minutes from Lake Michigan and 10 minutes from downtown Grand Rapids, there is plenty for the adults too',
  guest_capacity: 6,
  bedrooms: 2,
  beds: 2,
  baths: 2,
  kind: 'apartment',
  size: 80,
  is_public: true,
  address_id: 8,
  user_id: 8
)

PropertyImage.create(property_id: 8, source: 'https://i.ibb.co/WFMLk4H/595b5f29-3b46-4441-aa67-a2be6939c84e.webp')
PropertyImage.create(property_id: 8, source: 'https://i.ibb.co/J7nfmdZ/f767ccad-eb79-404d-89e0-dd20ca8b3d96.webp')
PropertyImage.create(property_id: 8, source: 'https://i.ibb.co/zXGr9Hn/f71daedc-dc03-4ca0-b9c0-08fdbf0bf892.webp')
PropertyImage.create(property_id: 8, source: 'https://i.ibb.co/H45NzqM/ecf7de4b-7514-4414-8d87-352d4fcf1858.webp')
PropertyImage.create(property_id: 8, source: 'https://i.ibb.co/f1WZkqt/d6812963-84c2-4983-a483-ad53098376e9.webp')
PropertyImage.create(property_id: 8, source: 'https://i.ibb.co/nfhZc5W/c380a8fd-d6dc-48ee-b260-830853706221.webp')
PropertyImage.create(property_id: 8, source: 'https://i.ibb.co/n3bgdVZ/366d8e94-7266-40e7-8ef1-606d6eb8ddd5.webp')
PropertyImage.create(property_id: 8, source: 'https://i.ibb.co/gjQsyKF/0ea037a4-20fc-480a-afc5-0f8837bc7821.webp')

PropertyCategory.create(property_id: 8, category_id: 16)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 2,
  rate: 130,
  user_id: 8,
  property_id: 8
)

Hosting.create(
  cycle: 1,
  minimum_cycle_amount: 2,
  rate: 1300,
  user_id: 8,
  property_id: 8
)

Hosting.create(
  cycle: 2,
  minimum_cycle_amount: 1,
  rate: 2948,
  user_id: 8,
  property_id: 8
)

BlockedPeriod.create(
  start_date: '2022, 11, 15',
  end_date: '2022, 11, 25',
  property_id: 8
)

BlockedPeriod.create(
  start_date: '2023, 01, 01',
  end_date: '2023, 01, 03',
  property_id: 8
)

BlockedPeriod.create(
  start_date: '2023, 01, 08',
  end_date: '2023, 01, 25',
  property_id: 8
)

# Create Chateau Pessac Property

chateau_pessac_address = Address.create(street: 'Unknown', city: 'Pessac', country: 'France', zip_code: '111115', number: 9, continent: 'Europe') # id = 9

chateau_pessac = Property.create(
  name: 'Chateau Pessac',
  description:
      'When the turreted roof of this chateau comes into view, guests will begin to understand the scale of grandeur this home represents. Painstakingly preserved and refitted to satisfy the most expectant of modern guests, this centuries-old chateau offers room after room of history and plush comfort with every step, right on the doorstep of metropolitan Bordeaux and France’s finest wine country.',
  guest_capacity: 12,
  bedrooms: 6,
  beds: 6,
  baths: 7,
  kind: 'house',
  size: 2200,
  is_public: true,
  address_id: 9,
  user_id: 9
)

PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/7rfyBrH/5cf60fda-63c1-45d3-84ad-e5c6f593f4af.webp')
PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/stXcVM2/ac3a26b3-e9aa-4b6a-b40f-fe88b361c35b.webp')
PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/KKGsVzG/fc0062e5-b322-4b65-993f-febffeaaffd3.webp')
PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/xFqdcgS/c0c0b77c-0bc5-4836-af0b-fddabcdf8a08.webp')
PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/JCY1gwB/3219f1c2-2778-440a-95db-48b4b4052c68.webp')
PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/x6S4RSt/923dee3f-0509-4b85-b2e8-0fe4987cffa5.webp')
PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/pnNJcQ7/682d90e6-b8df-493a-9f32-153b573456dc.webp')
PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/GczTvF9/3cb269ae-ded0-4d24-ad4e-269247444616.webp')
PropertyImage.create(property_id: 9, source: 'https://i.ibb.co/gyPf6Zy/3a9e4bd8-5281-49c0-a2f1-dbfa598cb2ae.webp')

PropertyCategory.create(property_id: 9, category_id: 16)
PropertyCategory.create(property_id: 9, category_id: 9)

Hosting.create(
  cycle: 0,
  minimum_cycle_amount: 3,
  rate: 2904,
  user_id: 9,
  property_id: 9
)

BlockedPeriod.create(
  start_date: '2022, 11, 15',
  end_date: '2022, 11, 25',
  property_id: 9
)

BlockedPeriod.create(
  start_date: '2023, 01, 01',
  end_date: '2023, 01, 03',
  property_id: 9
)

BlockedPeriod.create(
  start_date: '2023, 01, 08',
  end_date: '2023, 01, 25',
  property_id: 9
)

# Address.create(street: 'Calle 1', city: 'Bogota', country: 'Colombia', zip_code: '111111', number: 1)
# Address.create(street: 'Calle 2', city: 'Taiwan', country: 'China', zip_code: '111111', number: 2)

# Property.create(name: 'Casa 1', description: 'Casa 1', guest_capacity: 1, bedrooms: 1, beds: 1, bathrooms: 1, kind: 'apartment', address_id: 1, size: 1, user_id: 1)
# Property.create(name: 'Casa 2', description: 'Casa 2', guest_capacity: 2, bedrooms: 2, beds: 2, bathrooms: 2, kind: 'house', address_id: 2, size: 2, user_id: 2)
# Property.create(name: 'Casa 3', description: 'Casa 3', guest_capacity: 3, bedrooms: 3, beds: 3, bathrooms: 3, kind: 'apartment', address_id: 1, size: 3, user_id: 2)
# Hosting.create(cycle: 0, minimum_cycle_amount: 1, rate: 1, cleaning_fee: 1, user_id: 1, property_id: 1)
# Hosting.create(cycle: 1, minimum_cycle_amount: 1, rate: 1, cleaning_fee: 1, user_id: 1, property_id: 1)
# Hosting.create(cycle: 2, minimum_cycle_amount: 2, rate: 12, cleaning_fee: 1, user_id: 2, property_id: 2)
# BlockedPeriod.create(start_date: '2023-01-01', end_date: '20213-02-02', property_id: 1)
# Reservation.create(check_in: '2023-03-01', check_out: '2023-06-02', guests: 1, user_id: 1, hosting_id: 2, price: 100)
# PropertyImage.create(property_id: 1, source: 'https://images.unsplash.com/photo-1610078888888-1b1b1b1b1b1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')

# PropertyCategory.create(property_id: 1, category_id: 1)
# PropertyCategory.create(property_id: 2, category_id: 1)
# PropertyCategory.create(property_id: 1, category_id: 2)
