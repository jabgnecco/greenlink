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
Donation.destroy_all
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
  "Solar-Powered Desalination"
]

puts "Seeding Data "

descriptions = [
"Many schools in rural and underserved regions struggle with inadequate or unreliable electricity, limiting access to technology and hindering learning opportunities. Solar for Schools equips these institutions with solar panel systems, providing clean, uninterrupted energy for essential tools like lighting, computers, and projectors. This renewable energy solution fosters better educational outcomes while reducing reliance on diesel generators or unstable grid connections.
Additionally, the project integrates sustainability into the curriculum by teaching students about renewable energy systems and their benefits. These hands-on learning opportunities inspire eco-consciousness and encourage students to consider careers in the growing green energy sector. By combining education and clean energy access, this initiative empowers schools and their communities to embrace a sustainable future.",

"Rural communities often face energy insecurity due to insufficient infrastructure or high electricity costs. Community Wind Turbines harness the power of local wind resources to generate sustainable and affordable energy for these areas. Small-scale turbines provide a reliable source of electricity for households, businesses, and public facilities, reducing dependence on fossil fuels and lowering energy costs.
This initiative also emphasizes local ownership by involving community members in the planning, construction, and maintenance of the turbines. Training programs equip residents with the skills needed to manage the turbines, creating job opportunities and ensuring the long-term sustainability of the project. By blending clean energy with community empowerment, Community Wind Turbines strengthens rural resilience and promotes environmental stewardship.",

"In regions where water scarcity threatens agriculture and daily life, traditional water pumps powered by fossil fuels are expensive and unsustainable. Solar-Powered Water Pumps offer an eco-friendly alternative by using solar energy to power irrigation systems, ensuring consistent access to water for farming and household use. These pumps reduce operational costs for farmers while eliminating the carbon emissions associated with diesel-powered systems.
By improving water access, this project enhances food security and supports rural livelihoods. The combination of renewable energy and efficient water management allows communities to thrive while protecting the environment. Solar-Powered Water Pumps exemplify how solar technology can address both environmental and socioeconomic challenges.",

"The renewable energy sector offers vast potential for economic growth and environmental sustainability, but many regions lack skilled workers to meet industry demands. Renewable Energy Training addresses this gap by providing hands-on education in solar, wind, and biomass technologies. Participants, particularly youth and women, gain technical expertise and certifications that open doors to employment in the green energy industry.
Beyond skill-building, the program raises awareness about the importance of transitioning to renewable energy and energy-efficient practices. By creating a local workforce equipped to install and maintain clean energy systems, the project accelerates the adoption of renewables and empowers individuals to contribute to a sustainable future.",

"In off-grid areas, access to electricity is often limited or nonexistent, affecting quality of life and economic opportunities. Microgrids for Villages establishes small, localized power grids that run on renewable energy sources such as solar and wind. These microgrids provide consistent and affordable electricity to homes, schools, and small businesses, fostering community development while reducing reliance on diesel generators.
The project focuses on empowering communities to manage their own energy systems. Residents are trained in the operation and maintenance of the microgrids, ensuring long-term sustainability and creating local employment opportunities. By bringing renewable energy to rural areas, this initiative addresses energy poverty and promotes self-sufficiency in underserved regions.",

"Healthcare facilities in remote areas often struggle with unreliable electricity, putting patients' lives at risk. Solar-Powered Hospitals provides a sustainable solution by equipping these facilities with solar panels and battery storage systems. This ensures a steady supply of electricity for critical medical equipment, lighting, and refrigeration for vaccines and medications.
In addition to improving healthcare delivery, the project significantly reduces operational costs by eliminating dependency on expensive diesel generators. The savings can be redirected toward improving medical services and expanding access to care. By integrating clean energy into healthcare, this initiative improves patient outcomes while contributing to environmental sustainability.",

"The adoption of electric vehicles (EVs) is growing rapidly, but a lack of charging infrastructure remains a major barrier to widespread use. Electric Vehicle Charging Stations addresses this challenge by installing solar-powered EV chargers in urban and rural areas. These stations provide a clean and renewable energy source for EVs, reducing greenhouse gas emissions and promoting sustainable transportation.
By combining renewable energy with electric mobility, the project supports the global transition to low-carbon transportation systems. It also makes EV ownership more accessible, particularly in underserved regions where charging infrastructure is scarce. The initiative encourages the adoption of green technology and contributes to cleaner air and reduced environmental impact.",

"Traditional cooking methods in many regions rely on wood or charcoal, contributing to deforestation, indoor air pollution, and greenhouse gas emissions. Bioenergy for Cooking promotes the use of biogas systems as a sustainable alternative. These systems convert organic waste into clean fuel for cooking, reducing environmental harm while providing households with an affordable energy source.
This project improves public health by eliminating the harmful smoke associated with traditional stoves, which disproportionately affects women and children. Additionally, the use of biogas reduces the need for firewood collection, giving families more time to focus on education and other productive activities. By turning waste into energy, Bioenergy for Cooking supports both environmental conservation and community well-being.",

"ELow-income families often face high energy bills due to inefficient housing, which also increases their carbon footprint. Energy-Efficient Homes addresses this issue by constructing or retrofitting homes with sustainable materials, proper insulation, and solar panels. These energy-saving upgrades reduce energy consumption and provide families with access to renewable energy.
The project not only lowers household energy costs but also contributes to environmental sustainability by decreasing overall demand for fossil fuels. Families enjoy improved living conditions, while the community benefits from reduced emissions. By combining energy efficiency with renewable energy, Energy-Efficient Homes helps create a sustainable future for all.",

"Land scarcity and water surface availability make floating solar farms an innovative solution for generating renewable energy. Floating Solar Farms installs solar panels on reservoirs, lakes, or other bodies of water, maximizing energy production without occupying valuable land. These floating arrays also reduce water evaporation and help regulate the temperature of the water, enhancing its ecological benefits.
This project not only diversifies renewable energy infrastructure but also provides energy access to communities near water sources. By utilizing solar power in this unique way, the initiative contributes to reducing greenhouse gas emissions and optimizing land use. Floating Solar Farms is a scalable solution that combines innovation, sustainability, and efficiency.",

"Refugee camps often lack adequate lighting, which compromises safety and limits evening activities such as education or community gatherings. Solar Lights for Refugees addresses this issue by providing solar-powered lamps and streetlights to refugee settlements. These lights are reliable and sustainable, requiring no connection to the grid and offering an eco-friendly solution to a critical need.
The initiative improves the quality of life for refugees by enhancing safety and enabling productive activities after sunset. Solar lighting also reduces dependency on kerosene lamps, which are both costly and hazardous. By bringing renewable energy to vulnerable populations, Solar Lights for Refugees supports humanitarian efforts while promoting sustainability.",

"Remote communities often struggle with access to affordable and reliable electricity. Hydropower for Communities utilizes small-scale hydroelectric systems to harness energy from rivers and streams, providing clean and consistent power. These systems are designed to meet local energy needs without disrupting the natural flow of water, ensuring minimal environmental impact.
This initiative not only delivers renewable energy but also reduces reliance on fossil fuels, lowering greenhouse gas emissions. By creating community-owned energy solutions, the project empowers local residents and builds capacity for long-term management. Hydropower for Communities demonstrates how water resources can sustainably power rural development.",

"Harnessing wind energy efficiently requires constant innovation to maximize output and reduce costs. Wind Energy Innovation supports the development and implementation of cutting-edge wind turbine technologies. From vertical-axis turbines to more efficient blade designs, this initiative pushes the boundaries of what wind energy can achieve, making it more accessible and effective.
By testing and deploying these innovations in both urban and rural settings, the project ensures that wind energy can meet diverse energy needs. The initiative also prioritizes reducing the environmental footprint of turbine manufacturing and operation, creating a more sustainable energy supply chain. Wind Energy Innovation contributes to the global energy transition by driving advancements in wind technology.",

"Access to educational resources is vital for community growth, yet many rural areas lack the infrastructure needed to power libraries. Renewable Energy Libraries equips libraries with solar panels and small wind turbines, ensuring reliable electricity for lighting, computers, and digital learning tools. This transforms these spaces into centers of knowledge and connectivity.
The project also introduces sustainability workshops for community members, teaching them about renewable energy technologies. These libraries serve as hubs for learning and innovation, inspiring communities to embrace green energy solutions in other aspects of their lives. By merging education with renewable energy, Renewable Energy Libraries promotes both intellectual and environmental empowerment.",

"Water scarcity is a pressing issue in many regions, particularly in arid and coastal areas. Solar-Powered Desalination uses solar energy to power desalination plants, converting seawater into clean, drinkable water. This sustainable solution addresses the dual challenges of water scarcity and energy consumption, providing an eco-friendly alternative to traditional desalination methods.
The initiative supports communities struggling with limited access to fresh water, improving public health and enabling agricultural activities. By utilizing abundant solar resources, the project minimizes its carbon footprint and operational costs. Solar-Powered Desalination offers a scalable solution to one of the most urgent global challenges."
]


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
  "Perryan Lodge, The Green, Eythorne, CT15 4BN"
]

  renewable_energy_keywords = [
    "Solar Energy",
    "Wind Energy",
    "Solar Energy",
    "Mixed Renewable Energy (Solar, Wind, and Biomass)",
    "Mixed Renewable Energy (Solar and Wind)",
    "Solar Energy",
    "Electric Mobility (Solar-Powered Charging)",
    "Bioenergy",
    "Energy Efficiency and Solar Energy",
    "Solar Energy",
    "Solar Energy",
    "Hydropower",
    "Wind Energy",
    "Mixed Renewable Energy (Solar and Wind)",
    "Solar Energy"
  ]

number = 0
# directory_path = File.dirname(file_path.path)
# image_files = Dir.glob(File.join(directory_path, '*.png'))

15.times do
  puts "created #{number + 1} projects"
  # file = File.open("app/assets/images/odd13/ODD1.png")
  # image_file.each do |image_file|
  #   puts "Processing file: #{image_file}"
  #   file = File.open(image_file)
  #   puts "File content length: #{file.size}"
  #   file.close
  # end
  project = Project.new(
    user: user1,
    title: titles[number],
    address: addresses[number],
    region: "Europe",
    description: descriptions[number],
    auditor: Faker::Company.name,
    target: (50000..100000).to_a.sample,
    progress: 0
  )
  # project.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  project.save!
  Donation.create!(
    project: project,
    user: user1,
    donation_sku: "#{project.title.split.join('_')}_donation",
    amount: (5000..100000).to_a.sample,
    state: "Paid"
  )

    project = Project.create!(
      user: user1,
      title: titles[number],
      address: addresses[number],
      region: "Europe",
      description: descriptions[number],
      auditor: Faker::Company.name,
      target: (50000..100000).to_a.sample,
      progress: 0
    )
    Donation.create!(
      project: project,
      user: user1,
      donation_sku: "#{project.title.split.join('_')}_donation",
      amount: (5000..100000).to_a.sample,
      state: "Paid"
    )

    Category.create!(
      project: project,
      name: renewable_energy_keywords.sample
    )

  number += 1
end

puts "Project Created: #{Project.count}"
