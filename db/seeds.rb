
# Create categories
beachfront = Category.create(name: 'beachfront')
mansions = Category.create(name: 'mansions')
lakefront = Category.create(name: 'lakefront')
amazing_views = Category.create(name: 'amazing views')
countryside = Category.create(name: 'countryside')
tiny_homes = Category.create(name: 'tiny homes')
iconic_cities = Category.create(name: 'iconic cities')
luxe = Category.create(name: 'luxe')
surfing = Category.create(name: 'surfing')
skiing = Category.create(name: 'skiing')
houseboats = Category.create(name: 'houseboats')
desert = Category.create(name: 'desert')
historical_homes = Category.create(name: 'historical homes')
beach = Category.create(name: 'beach')
castles = Category.create(name: 'castles')

# Create users
admin = User.create(name: "Mr Admin", email: "admin@test.com", password: "123123", role: 1)
david = User.create(name: 'David Verde', email: 'david@gmail.com', password: '123456')
gabriel = User.create(name: 'Gabriel Santo', email: 'gabriel@test.com', password: '123123')

# Create the Luxury Beachfront Six Palms Villas property
luxury_property_address = Address.create(street: 'Unknown', city: 'Rocky Point', country: 'Mexico', zip_code: '111111', number: 1)

luxury_property = Property.create(
  name: 'Luxury Beachfront Six Palms Villas # 1',
  description: 'This is the house perfect for you! Near to the beach, to markets, gyms, etc. Reserve a date!',
  guest_capacity: 9,
  bedrooms: 3,
  beds: 5,
  baths: 3,
  kind: 'house',
  size: 690,
  address_id: luxury_property_address.id,
  user_id: gabriel.id
)

PropertyImage.create(property_id: luxury_property.id, source: 'https://i.ibb.co/XpgGTmY/62ad847e-2f84-49cb-a8a7-35856dc93a20.webp')
PropertyImage.create(property_id: luxury_property.id, source: 'https://i.ibb.co/103Qnyr/d88dfa7d-113a-4e26-b3fd-d819df85a446.webp')
PropertyImage.create(property_id: luxury_property.id, source: 'https://i.ibb.co/N7rfLcs/c7ec5fd9-ae03-40f9-9632-9ce1a77a3df2.webp')
PropertyImage.create(property_id: luxury_property.id, source: 'https://i.ibb.co/2j0Kvgy/6513c49a-7537-4175-be57-f7581f393b43.webp')
PropertyImage.create(property_id: luxury_property.id, source: 'https://i.ibb.co/CJnmm8J/492ee2ac-55f8-4c50-8f72-877cc0aa784f.webp')
PropertyImage.create(property_id: luxury_property.id, source: 'https://i.ibb.co/vz1Nrkj/70e4749a-e369-4807-9cfd-a1c344ccf847.webp')
PropertyImage.create(property_id: luxury_property.id, source: 'https://i.ibb.co/XpgGTmY/62ad847e-2f84-49cb-a8a7-35856dc93a20.webp')
PropertyImage.create(property_id: luxury_property.id, source: 'https://i.ibb.co/nj5Kd7c/2e505f86-c67c-4353-a542-5ea1eab24f51.webp')

PropertyCategory.create(property_id: luxury_property.id, category_id: beachfront.id)
PropertyCategory.create(property_id: luxury_property.id, category_id: mansions.id)
PropertyCategory.create(property_id: luxury_property.id, category_id: luxe.id)
PropertyCategory.create(property_id: luxury_property.id, category_id: beach.id)

Hosting.create(
  cycle: 0, 
  minimum_cycle_amount: 3, 
  rate: 365, 
  public: true, 
  user_id: gabriel.id, 
  property_id: luxury_property.id
)
Hosting.create(
  cycle: 1, 
  minimum_cycle_amount: 1, 
  rate: 2415, 
  public: true, 
  user_id: gabriel.id, 
  property_id: luxury_property.id
)

BlockedPeriod.create(
  start_date: '2022-11-15', 
  end_date: '2022-11-25', 
  property_id: luxury_property.id 
)
BlockedPeriod.create(
  start_date: '2023-01-01', 
  end_date: '2023-01-08', 
  property_id: luxury_property.id 
)

# Address.create(street: 'Calle 1', city: 'Bogota', country: 'Colombia', zip_code: '111111', number: 1)
# Address.create(street: 'Calle 2', city: 'Taiwan', country: 'China', zip_code: '111111', number: 2)

# Property.create(name: 'Casa 1', description: 'Casa 1', guest_capacity: 1, bedrooms: 1, beds: 1, bathrooms: 1, kind: 'apartment', address_id: 1, size: 1, user_id: 1)
# Property.create(name: 'Casa 2', description: 'Casa 2', guest_capacity: 2, bedrooms: 2, beds: 2, bathrooms: 2, kind: 'house', address_id: 2, size: 2, user_id: 2)
# Property.create(name: 'Casa 3', description: 'Casa 3', guest_capacity: 3, bedrooms: 3, beds: 3, bathrooms: 3, kind: 'apartment', address_id: 1, size: 3, user_id: 2)
# Hosting.create(cycle: 0, minimum_cycle_amount: 1, rate: 1, public: true, cleaning_fee: 1, user_id: 1, property_id: 1)
# Hosting.create(cycle: 1, minimum_cycle_amount: 1, rate: 1, public: true, cleaning_fee: 1, user_id: 1, property_id: 1)
# Hosting.create(cycle: 2, minimum_cycle_amount: 2, rate: 12, public: true, cleaning_fee: 1, user_id: 2, property_id: 2)
# BlockedPeriod.create(start_date: '2023-01-01', end_date: '20213-02-02', property_id: 1)
# Reservation.create(check_in: '2023-03-01', check_out: '2023-06-02', guests: 1, user_id: 1, hosting_id: 2, price: 100)
# PropertyImage.create(property_id: 1, source: 'https://images.unsplash.com/photo-1610078888888-1b1b1b1b1b1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')

# PropertyCategory.create(property_id: 1, category_id: 1)
# PropertyCategory.create(property_id: 2, category_id: 1)
# PropertyCategory.create(property_id: 1, category_id: 2)