# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

puts "Cleaning Database..."
Project.destroy_all
puts "Creating Projects..."

puts "Seeding Data "

User.destroy_all
puts "Creating Users..."
user1 = User.new(
  first_name: "john",
  last_name: "smith",
  email: "test@greenlink.com",
  password: "123123"
)
user1.save!
p user1
p user1.valid?

puts "User Created: #{User.count}"

titles = [
  "Solar for Schools",
  "Community Wind Turbines",
  "Solar-Powered Water Pumps",
  "Renewable Energy Training",
  "Microgrids for Villages",
  "Solar-Powered Hospitals",
  "Electric Vehicle Charging Stations",
  "Bioenergy for Cooking",
  "Energy-Efficient Homes",
  "Floating Solar Farms",
  "Solar Lights for Refugees",
  "Hydropower for Communities",
  "Wind Energy Innovation",
  "Renewable Energy Libraries",
  "Solar-Powered Desalination",
  "Green Energy for Orphanages",
  "Carbon-Neutral Events",
  "Solar Boats",
  "Renewable Energy Startups",
  "Hybrid Solar and Wind Systems",
  "Solar Street Lighting",
  "Geothermal Heating Systems",
  "Algae Biofuel Projects",
  "Solar-Powered Education Kits",
  "Eco-Friendly Urban Transport",
  "Smart Grids for Developing Regions",
  "Waste-to-Energy Plants",
  "Solar Greenhouses",
  "Offshore Wind Farms",
  "Clean Energy for Island Communities",
  "Battery Recycling Initiatives",
  "Wind-Powered Water Filtration",
  "Solar-Powered Internet Hubs",
  "Clean Energy Art Installations",
  "Hydrogen Fuel Innovations",
  "Solar-Powered Emergency Kits",
  "Wave Energy Technology",
  "Reforestation with Solar Power",
  "Renewable-Powered Public Transport",
  "Solar Farms for Food Security",
  "Biomass Heating for Schools",
  "Solar-Powered Charging Stations",
  "Renewable Energy Scholarships",
  "Community Energy Co-ops",
  "Clean Energy for Monasteries",
  "Green Data Centers",
  "Urban Solar Rooftops",
  "Zero-Energy Schools",
  "Solar Refrigerators for Farmers",
  "Energy Access Advocacy"]
puts "Seeding Data "

descriptions = [
"Solar for Schools: Install solar panels in underprivileged schools to provide clean, reliable energy for education.",
"Community Wind Turbines: Build small wind turbines in rural areas to power local homes sustainably.",
"Solar-Powered Water Pumps: Enable farmers to access water using solar energy in drought-affected regions.",
"Renewable Energy Training: Fund vocational programs to teach renewable energy skills in developing countries.",
"Microgrids for Villages: Set up renewable microgrids to provide power to off-grid communities.",
"Solar-Powered Hospitals: Equip remote health clinics with solar panels for uninterrupted medical care.",
"Electric Vehicle Charging Stations: Expand EV infrastructure in urban and rural areas to reduce emissions.",
"Bioenergy for Cooking: Replace traditional stoves with biogas units to reduce deforestation and indoor air pollution.",
"Energy-Efficient Homes: Support the construction of affordable, green housing for low-income families.",
"Floating Solar Farms: Develop solar installations on reservoirs to generate power without land use conflicts.",
"Solar Lights for Refugees: Distribute solar-powered lamps in refugee camps to improve safety and quality of life.",
"Hydropower for Communities: Construct small-scale hydro projects to provide consistent energy in mountainous regions.",
"Wind Energy Innovation: Support startups creating low-cost, efficient wind turbines for small communities.",
"Renewable Energy Libraries: Create educational hubs powered by solar energy to promote learning and technology.",
"Solar-Powered Desalination: Fund systems that use solar energy to provide clean drinking water in arid regions.",
"Green Energy for Orphanages: Install solar panels to reduce energy costs and improve care facilities for children.",
"Carbon-Neutral Events: Develop portable renewable energy systems to power festivals and public gatherings.",
"Solar Boats: Build solar-powered boats to reduce emissions in fishing and transport industries.",
"Renewable Energy Startups: Provide seed funding for innovative green energy businesses in emerging economies.",
"Hybrid Solar and Wind Systems: Combine solar and wind installations to maximize renewable energy generation.",
"Solar Street Lighting: Replace traditional streetlights with solar-powered ones in underlit urban and rural areas.",
"Geothermal Heating Systems: Install geothermal units in community centers to reduce reliance on fossil fuels.",
"Algae Biofuel Projects: Support research into algae-based biofuels as a sustainable energy source.",
"Solar-Powered Education Kits: Distribute kits that teach students how to build basic solar energy devices.",
"Eco-Friendly Urban Transport: Sponsor electric bike and scooter-sharing programs in cities.",
"Smart Grids for Developing Regions: Establish modern grids to improve renewable energy distribution in rural areas.",
"Waste-to-Energy Plants: Create facilities that convert organic waste into renewable biogas.",
"Solar Greenhouses: Help farmers grow crops sustainably using solar-powered greenhouses.",
"Offshore Wind Farms: Support projects to harness wind energy from ocean breezes.",
"Clean Energy for Island Communities: Transition island grids to 100% renewable energy sources.",
"Battery Recycling Initiatives: Develop facilities to recycle and repurpose used batteries sustainably.",
"Wind-Powered Water Filtration: Provide clean water using wind-powered filtration systems.",
"Solar-Powered Internet Hubs: Set up solar-powered connectivity hubs in remote areas to bridge the digital divide.",
"Clean Energy Art Installations: Fund artists creating installations powered by renewable energy to inspire change.",
"Hydrogen Fuel Innovations: Research hydrogen as a green alternative to fossil fuels.",
"Solar-Powered Emergency Kits: Provide disaster zones with kits that include solar panels and batteries.",
"Wave Energy Technology: Invest in technologies harnessing energy from ocean waves.",
"Reforestation with Solar Power: Power reforestation efforts with renewable energy tools.",
"Renewable-Powered Public Transport: Help cities transition buses and trains to renewable energy sources.",
"Solar Farms for Food Security: Use solar panels to power irrigation and boost food production.",
"Biomass Heating for Schools: Install biomass systems in schools to reduce heating costs and emissions.",
"Solar-Powered Charging Stations: Provide free solar-powered charging points in underserved areas.",
"Renewable Energy Scholarships: Offer educational scholarships for green energy and sustainability programs.",
"Community Energy Co-ops: Help establish cooperatives to manage and share renewable energy locally.",
"Clean Energy for Monasteries: Transition sacred sites to renewable energy to showcase eco-friendly spirituality.",
"Green Data Centers: Invest in data centers powered entirely by renewable energy.",
"Urban Solar Rooftops: Equip city rooftops with solar panels to reduce urban carbon footprints.",
"Zero-Energy Schools: Build schools that generate as much energy as they consume.",
"Solar Refrigerators for Farmers: Provide solar-powered refrigeration units to reduce food waste.",
"Energy Access Advocacy: Support campaigns that push for greater adoption of renewables worldwide."]


addresses = ["42 Spearman Walk, Hartlepool, TS27 3PD",
  "Wickham Cottage, Chideock, DT6 6JB",
  "Arkil, Wadborough Road, Norton, WR5 2QN",
  "Sunset, Standlake Road, Ducklington, OX29 7UZ",
  "21 St Lawrence Road, Eastleigh, SO50 4GB",
  "6 Henshall Close, Shavington, CW2 5XE",
  "Gwynant, Plumley Moor Road, Plumley, WA16 0TR",
  "8 Kingston Way, Shoreham-By-Sea, BN43 6YA",
  "10 Cavell Drive, Danesmoor, S45 9SD",
  "25 Briars Brook, Lathom, L40 5XD",
  "145 Stanley Road, Teddington, TW11 8UF",
  "17 Copperas Lane, Droylsden, M43 6HP",
  "Flat 6, Marlborough House, Park Road, Bognor Regis, PO21 2PZ",
  "15 Poppy Court, Headstone Drive, Harrow, HA3 5UB",
  "Perryan Lodge, The Green, Eythorne, CT15 4BN",
  "3 Millers Copse, Millers Lane, Outwood, RH1 5QB",
  "1 Sheralds Croft Lane, Thriplow, SG8 7RB",
  "9 Parc Clai Coediog, Pentraeth, LL75 8HQ",
  "Herdwick, Winkleigh, EX19 8LD",
  "2 Old Chapel, Main Street, Gisburn, BB7 4HH",
  "48 Nadder Park Road, Exeter, EX4 1NU",
  "2 Rose Farm Close, Ferndown, BH22 8JA",
  "Hyfrydle, Capel Curig, LL24 0EU",
  "Flat 9, Merlins Court, 30 Margery Street, London, WC1X 0JG",
  "16 The Veale, Bleadon, BS24 0NW",
  "1 Sutton Lane, London, EC1M 5PU",
  "Flat 43, 6 Birkby Close, Hamilton, LE5 1PS",
  "Westering, Poulders Road, Sandwich, CT13 0LU",
  "5 High Trees Road, Knowle, B93 9PR",
  "2 Jeake Drive, Rye, TN31 7FH",
  "11 Yarrow Close, Gloucester, GL4 6SR",
  "Apartment 20, Nye House, 324 Sherlock Street, Birmingham, B5 7EQ",
  "124 Minto Street, Ashton-Under-Lyne, OL7 9BG",
  "29 Imber Cross, Thames Ditton, KT7 0LG",
  "16 Cotswold Green, Leicester, LE4 2LF",
  "119 Penton Road, Staines, TW18 2LL",
  "29A Studland Road, London, W7 3QU",
  "Flat 22, Stonehouse House, Westbourne Park Road, London, W2 5UU",
  "2 Clos Bowen, Llanelli, SA15 4BQ",
  "31 Beauchamp Street, Cardiff, CF11 6AX",
  "Flat 8, 4 Berkeley Street, Cheltenham, GL52 2SX",
  "5 West Drive, Neston, CH64 0SA",
  "14 Bradford Road, Otley, LS21 3EQ",
  "80 Village Way, Beckenham, BR3 3NR",
  "21 Wildflower Lane, Shaftesbury, SP7 8UA",
  "48 Wordsworth Close, Tipton, DY4 0TQ",
  "Cornerwyas, Middle Hill, Chalford Hill, GL6 8BD",
  "3 Poplar Road, Wooburn Green, HP10 0FA",
  "Cilrhiwe, Llangrannog, SA44 6SL",
  "203 Sandown Road, Shanklin, PO37 6HE"]

number = 0

50.times do
    project = Project.create!(
    user: user1,
    title: titles[number],
    address: addresses[number],
    description: descriptions[number],
    auditor: Faker::FunnyName,
    target: Faker::Number.decimal(l_digits: 3, r_digits: 3),
    progress: 0
  )
    Donation.create!(
      project: project,
      user: user1,
      amount: 20.000,
      state: "Paid"
    )
  number += 1
end

puts "Project Created: #{Project.count}"
