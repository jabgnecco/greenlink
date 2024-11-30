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
    "Tengger Desert Solar Park",
    "Hornsdale Power Reserve",
    "Noor Ouarzazate Solar Complex",
    "Walney Extension Offshore Wind Farm",
    "Sihwa Lake Tidal Power Station",
    "Lake Turkana Wind Power Project",
    "Itaipu Hydroelectric Plant",
    "Hornsea Project One",
    "Murchison Renewable Hydrogen Project",
    "KivuWatt",
    "Vindeby Offshore Wind Farm",
    "Hellisheidi Geothermal Power Plant",
    "Alta Wind Energy Center",
    "Walchensee Hydroelectric Power Plant",
    "Gemini Solar Project",
  ]

  auditors = [
    "GreenPeak Auditors",
    "SolarTrust Solutions",
    "EcoAudit Group",
    "RenewEx Audit Services",
    "PowerWise Auditing",
    "BlueSky Energy Auditors",
    "CleanEnergy Compliance",
    "EnviroCheck Auditors",
    "SunCert Auditing",
    "EcoVerify Consulting",
    "GreenGuard Energy Auditors",
    "SolisTech Auditors",
    "EarthFirst Renewable Audits",
    "GreenWave Inspection Services",
    "ClearPath Energy Audits"
  ]

  addresses = [
    "Zhongwei, Ningxia, China",
    "Hornsdale SA 5491, Australia",
    "Ouarzazate, Morocco",
    "Lancashire, United Kingdom",
    "Sihwa Lake, South Korea",
    "Kenya",
    "Brazil",
    "Yorkshire, United Kingdom",
    "Perth, Western Australia",
    "Gitesi, Rwanda",
    "Denmark",
    "Hellisheiðarvirkjun, 816 Ölfus, Iceland",
    "Tehachapi Pass, Kern County, California",
    "Kochel, Bavaria, Germany",
    "Mojave Desert, California, USA",

  ]

  regions = [
    "Asia",
    "Oceania",
    "Africa",
    "Europe",
    "Asia",
    "Africa",
    "South America",
    "Europe",
    "Oceania",
    "Africa",
    "Europe",
    "Europe",
    "North America",
    "Europe",
    "North America",
  ]

renewable_energy_keywords = [
    "Solar Energy",
    "Wind Energy",
    "Solar Energy",
    "Wind Energy",
    "Tidal Energy",
    "Solar Energy",
    "Hyrdopower",
    "Wind Energy",
    "Mixed Energy",
    "Biogas",
    "Wind Energy",
    "Geothermal Energy",
    "Wind Energy",
    "Hydropower",
    "Solar Energy"
  ]

  # old energies:
  # renewable_energy_keywords = [
  #   "Solar Energy",
  #   "Wind Energy",
  #   "Hydropower",
  #   "Mixed Energy",
  #   "Solar Energy",
  #   "Solar Energy",
  #   "Electric Vehicles",
  #   "Bionergy",
  #   "Solar Energy",
  #   "Biogas",
  #   "Wind Energy",
  #   "Hydropower",
  #   "Wind Energy",
  #   "Hydropower",
  #   "Solar Energy"
  # ]

  # old titles:
  # titles = [
    #   "Solar for Schools",
    #   "Community Wind Turbines",
    #   "Solar-Powered Water Pumps",
    #   "Renewable Energy Training",
    #   "Microgrids for Villages",
    #   "Solar-Powered Hospitals",
    #   "Electric Vehicle Charging Stations",
    #   "Bioenergy for Cooking",
    #   "Energy-Efficient Homes",
#   "Floating Solar Farms",
#   "Solar Lights for Refugees",
#   "Hydropower for Communities",
#   "Wind Energy Innovation",
#   "Renewable Energy Libraries",
#   "Solar-Powered Desalination"
# ]

puts "Seeding Data "

# descriptions = [
#   "One of the largest solar power installations globally, with a capacity of 1,547 MW, located in the Tengger Desert.",

#   "Located in South Australia, this Tesla-built lithium-ion battery system stabilizes renewable energy from nearby wind farms.",

# ]

# old descriptions:

descriptions = [
"The Tengger Desert Solar Park, located in Zhongwei, Ningxia, China, is one of the world's largest solar power facilities. Spanning over 1,200 square kilometers of the Tengger Desert, it is often called the \"Great Wall of Solar.\" The park boasts a total installed capacity of approximately 1.5 gigawatts, supplying renewable energy to millions of homes.
  Its scale highlights China's commitment to transitioning to clean energy and reducing carbon emissions, showcasing the potential of vast, underutilized desert landscapes for sustainable power generation.",


"The Hornsdale Power Reserve, located in South Australia, is one of the world’s largest lithium-ion battery installations, built by Tesla and owned by Neoen. It was commissioned in 2017 to provide grid stability, store renewable energy, and respond rapidly to power outages. The facility, also known as the \"Tesla Big Battery,\" has significantly improved energy reliability in the region, reducing costs and emissions by complementing the nearby Hornsdale Wind Farm. Initially rated at 100 MW/129 MWh, it was expanded in 2020 to 150 MW/193.5 MWh, further enhancing its capabilities.",

"The Noor Ouarzazate Solar Complex, located near Ouarzazate, Morocco, is one of the world's largest solar power facilities, blending concentrated solar power (CSP) and photovoltaic (PV) technologies. Spanning over 3,000 hectares, it comprises multiple phases: Noor I, II, and III utilize CSP with thermal storage to generate power even after sunset, while Noor IV employs PV technology. With a total capacity exceeding 580 MW, the complex plays a pivotal role in Morocco's renewable energy strategy, aiming to generate 52% of its energy from renewables by 2030. It demonstrates innovation in harnessing solar energy to combat climate change.",

"The Walney Extension Offshore Wind Farm, located in the Irish Sea off the coast of Cumbria, England, is one of the world's largest operational offshore wind farms. Commissioned in 2018, it has a capacity of 659 megawatts (MW), generated by 87 turbines spread across 145 square kilometers. Developed by Ørsted, the farm provides clean energy to over 600,000 UK homes annually, demonstrating significant advancements in renewable energy and offshore wind technology.",

"The Sihwa Lake Tidal Power Station, located on the west coast of South Korea, is the world's largest tidal power facility, with an installed capacity of 254 MW. Operational since 2011, it harnesses tidal energy through a seawall that separates Sihwa Lake from the Yellow Sea. The plant uses tidal inflow to drive 10 turbines, generating renewable energy while also improving water quality in the previously polluted lake by allowing controlled seawater exchange. It serves as a model for sustainable energy development and environmental restoration.",

"The Lake Turkana Wind Power Project (LTWP) is the largest wind farm in Africa, located in Marsabit County, northern Kenya. It consists of 365 turbines spread across the Turkana Corridor, a region with consistently strong winds, generating 310 megawatts of renewable energy. Operational since 2019, the project significantly contributes to Kenya's energy mix, accounting for about 15% of the country’s electricity demand. LTWP supports Kenya’s green energy ambitions while promoting local community development through infrastructure projects and employment opportunities.",

"The Itaipu Hydroelectric Plant, located on the Paraná River at the border of Brazil and Paraguay, is one of the world's largest hydroelectric power facilities. Completed in 1984, it boasts a generating capacity of 14,000 megawatts through its 20 turbines, supplying electricity to both countries. A marvel of engineering, Itaipu is celebrated for its massive dam, which spans 7.2 kilometers and stands 196 meters tall. It plays a critical role in regional energy production, providing about 10% of Brazil's and 90% of Paraguay's electricity needs, while also serving as a symbol of bilateral cooperation.",

"Hornsea Project One is a large-scale offshore wind farm located in the North Sea, off the coast of the United Kingdom. It is one of the world's largest offshore wind farms, consisting of 174 turbines with a total capacity of 1.2 gigawatts, enough to power over one million homes. The project is part of the UK's efforts to transition to renewable energy, and its construction was completed in 2020.",

"The Murchison Renewable Hydrogen Project is an ambitious renewable energy initiative located in Western Australia. It aims to produce green hydrogen by using wind and solar power to electrolyze water, creating hydrogen without carbon emissions. The project is set to be one of the largest of its kind in the region, with the goal of both powering local industries and exporting hydrogen globally, contributing to the transition to a low-carbon economy.",

"KivuWatt is a power generation project located on Lake Kivu in Rwanda. It harnesses methane gas trapped in the lake’s deep waters to generate electricity. The project aims to address Rwanda's energy needs while also mitigating the environmental risks associated with methane buildup in the lake. KivuWatt is a key part of the country's renewable energy strategy, contributing significantly to Rwanda's power supply.",

"The Vindeby Offshore Wind Farm, located off the coast of Denmark, was the world's first commercial offshore wind farm, inaugurated in 1991. It consisted of 11 turbines with a total capacity of 5 MW, and was situated about 4.5 kilometers from the shore in the Smålandsfarvandet strait. While it was a pioneering project for offshore wind energy, it was decommissioned in 2017 to make way for newer, more powerful technologies. Vindeby played a crucial role in demonstrating the viability of offshore wind power.",

"The Hellisheidi Geothermal Power Plant, located near Reykjavik in Iceland, is one of the largest geothermal power plants in the world. It harnesses the Earth's natural heat from the Hengill volcanic area to generate electricity and provide hot water for district heating. The plant uses advanced technology to extract steam and hot water from deep underground reservoirs, contributing significantly to Iceland's renewable energy production and sustainable development.",

"The Alta Wind Energy Center, located in the Tehachapi Mountains of California, is one of the largest wind farms in the United States. It spans over 100 square miles and consists of more than 600 wind turbines, generating a total capacity of over 1,500 megawatts. The facility plays a crucial role in supplying renewable energy to the state’s grid and contributes significantly to California's clean energy goals.",

"The Walchensee Hydroelectric Power Plant, located in Bavaria, Germany, is one of the largest and oldest hydroelectric facilities in the country. It harnesses the power of water from the Walchensee, a large lake, to generate electricity. The plant's system consists of a pumped-storage facility, where water is pumped to a higher reservoir during low demand and released to generate power during peak demand. Its construction began in the 1920s, and it continues to be an essential part of the region's renewable energy infrastructure.",

"The Gemini Solar Project is a large-scale solar power facility located in southern Nevada, designed to generate approximately 690 megawatts of clean electricity. Once completed, it is expected to be one of the largest solar installations in the United States, covering over 7,000 acres of land. The project aims to provide sustainable energy to help reduce carbon emissions and support renewable energy goals, with power being sold to Nevada utility NV Energy. It incorporates both photovoltaic solar panels and energy storage systems to enhance grid stability.",
]

# descriptions = [
# "Many schools in rural and underserved regions struggle with inadequate or unreliable electricity, limiting access to technology and hindering learning opportunities. Solar for Schools equips these institutions with solar panel systems, providing clean, uninterrupted energy for essential tools like lighting, computers, and projectors. This renewable energy solution fosters better educational outcomes while reducing reliance on diesel generators or unstable grid connections.
# Additionally, the project integrates sustainability into the curriculum by teaching students about renewable energy systems and their benefits. These hands-on learning opportunities inspire eco-consciousness and encourage students to consider careers in the growing green energy sector. By combining education and clean energy access, this initiative empowers schools and their communities to embrace a sustainable future.",

# "Rural communities often face energy insecurity due to insufficient infrastructure or high electricity costs. Community Wind Turbines harness the power of local wind resources to generate sustainable and affordable energy for these areas. Small-scale turbines provide a reliable source of electricity for households, businesses, and public facilities, reducing dependence on fossil fuels and lowering energy costs.
# This initiative also emphasizes local ownership by involving community members in the planning, construction, and maintenance of the turbines. Training programs equip residents with the skills needed to manage the turbines, creating job opportunities and ensuring the long-term sustainability of the project. By blending clean energy with community empowerment, Community Wind Turbines strengthens rural resilience and promotes environmental stewardship.",

# "In regions where water scarcity threatens agriculture and daily life, traditional water pumps powered by fossil fuels are expensive and unsustainable. Solar-Powered Water Pumps offer an eco-friendly alternative by using solar energy to power irrigation systems, ensuring consistent access to water for farming and household use. These pumps reduce operational costs for farmers while eliminating the carbon emissions associated with diesel-powered systems.
# By improving water access, this project enhances food security and supports rural livelihoods. The combination of renewable energy and efficient water management allows communities to thrive while protecting the environment. Solar-Powered Water Pumps exemplify how solar technology can address both environmental and socioeconomic challenges.",

# "The renewable energy sector offers vast potential for economic growth and environmental sustainability, but many regions lack skilled workers to meet industry demands. Renewable Energy Training addresses this gap by providing hands-on education in solar, wind, and biomass technologies. Participants, particularly youth and women, gain technical expertise and certifications that open doors to employment in the green energy industry.
# Beyond skill-building, the program raises awareness about the importance of transitioning to renewable energy and energy-efficient practices. By creating a local workforce equipped to install and maintain clean energy systems, the project accelerates the adoption of renewables and empowers individuals to contribute to a sustainable future.",

# "In off-grid areas, access to electricity is often limited or nonexistent, affecting quality of life and economic opportunities. Microgrids for Villages establishes small, localized power grids that run on renewable energy sources such as solar and wind. These microgrids provide consistent and affordable electricity to homes, schools, and small businesses, fostering community development while reducing reliance on diesel generators.
# The project focuses on empowering communities to manage their own energy systems. Residents are trained in the operation and maintenance of the microgrids, ensuring long-term sustainability and creating local employment opportunities. By bringing renewable energy to rural areas, this initiative addresses energy poverty and promotes self-sufficiency in underserved regions.",

# "Healthcare facilities in remote areas often struggle with unreliable electricity, putting patients' lives at risk. Solar-Powered Hospitals provides a sustainable solution by equipping these facilities with solar panels and battery storage systems. This ensures a steady supply of electricity for critical medical equipment, lighting, and refrigeration for vaccines and medications.
# In addition to improving healthcare delivery, the project significantly reduces operational costs by eliminating dependency on expensive diesel generators. The savings can be redirected toward improving medical services and expanding access to care. By integrating clean energy into healthcare, this initiative improves patient outcomes while contributing to environmental sustainability.",

# "The adoption of electric vehicles (EVs) is growing rapidly, but a lack of charging infrastructure remains a major barrier to widespread use. Electric Vehicle Charging Stations addresses this challenge by installing solar-powered EV chargers in urban and rural areas. These stations provide a clean and renewable energy source for EVs, reducing greenhouse gas emissions and promoting sustainable transportation.
# By combining renewable energy with electric mobility, the project supports the global transition to low-carbon transportation systems. It also makes EV ownership more accessible, particularly in underserved regions where charging infrastructure is scarce. The initiative encourages the adoption of green technology and contributes to cleaner air and reduced environmental impact.",

# "Traditional cooking methods in many regions rely on wood or charcoal, contributing to deforestation, indoor air pollution, and greenhouse gas emissions. Bioenergy for Cooking promotes the use of biogas systems as a sustainable alternative. These systems convert organic waste into clean fuel for cooking, reducing environmental harm while providing households with an affordable energy source.
# This project improves public health by eliminating the harmful smoke associated with traditional stoves, which disproportionately affects women and children. Additionally, the use of biogas reduces the need for firewood collection, giving families more time to focus on education and other productive activities. By turning waste into energy, Bioenergy for Cooking supports both environmental conservation and community well-being.",

# "ELow-income families often face high energy bills due to inefficient housing, which also increases their carbon footprint. Energy-Efficient Homes addresses this issue by constructing or retrofitting homes with sustainable materials, proper insulation, and solar panels. These energy-saving upgrades reduce energy consumption and provide families with access to renewable energy.
# The project not only lowers household energy costs but also contributes to environmental sustainability by decreasing overall demand for fossil fuels. Families enjoy improved living conditions, while the community benefits from reduced emissions. By combining energy efficiency with renewable energy, Energy-Efficient Homes helps create a sustainable future for all.",

# "Land scarcity and water surface availability make floating solar farms an innovative solution for generating renewable energy. Floating Solar Farms installs solar panels on reservoirs, lakes, or other bodies of water, maximizing energy production without occupying valuable land. These floating arrays also reduce water evaporation and help regulate the temperature of the water, enhancing its ecological benefits.
# This project not only diversifies renewable energy infrastructure but also provides energy access to communities near water sources. By utilizing solar power in this unique way, the initiative contributes to reducing greenhouse gas emissions and optimizing land use. Floating Solar Farms is a scalable solution that combines innovation, sustainability, and efficiency.",

# "Refugee camps often lack adequate lighting, which compromises safety and limits evening activities such as education or community gatherings. Solar Lights for Refugees addresses this issue by providing solar-powered lamps and streetlights to refugee settlements. These lights are reliable and sustainable, requiring no connection to the grid and offering an eco-friendly solution to a critical need.
# The initiative improves the quality of life for refugees by enhancing safety and enabling productive activities after sunset. Solar lighting also reduces dependency on kerosene lamps, which are both costly and hazardous. By bringing renewable energy to vulnerable populations, Solar Lights for Refugees supports humanitarian efforts while promoting sustainability.",

# "Remote communities often struggle with access to affordable and reliable electricity. Hydropower for Communities utilizes small-scale hydroelectric systems to harness energy from rivers and streams, providing clean and consistent power. These systems are designed to meet local energy needs without disrupting the natural flow of water, ensuring minimal environmental impact.
# This initiative not only delivers renewable energy but also reduces reliance on fossil fuels, lowering greenhouse gas emissions. By creating community-owned energy solutions, the project empowers local residents and builds capacity for long-term management. Hydropower for Communities demonstrates how water resources can sustainably power rural development.",

# "Harnessing wind energy efficiently requires constant innovation to maximize output and reduce costs. Wind Energy Innovation supports the development and implementation of cutting-edge wind turbine technologies. From vertical-axis turbines to more efficient blade designs, this initiative pushes the boundaries of what wind energy can achieve, making it more accessible and effective.
# By testing and deploying these innovations in both urban and rural settings, the project ensures that wind energy can meet diverse energy needs. The initiative also prioritizes reducing the environmental footprint of turbine manufacturing and operation, creating a more sustainable energy supply chain. Wind Energy Innovation contributes to the global energy transition by driving advancements in wind technology.",

# "Access to educational resources is vital for community growth, yet many rural areas lack the infrastructure needed to power libraries. Renewable Energy Libraries equips libraries with solar panels and small wind turbines, ensuring reliable electricity for lighting, computers, and digital learning tools. This transforms these spaces into centers of knowledge and connectivity.
# The project also introduces sustainability workshops for community members, teaching them about renewable energy technologies. These libraries serve as hubs for learning and innovation, inspiring communities to embrace green energy solutions in other aspects of their lives. By merging education with renewable energy, Renewable Energy Libraries promotes both intellectual and environmental empowerment.",

# "Water scarcity is a pressing issue in many regions, particularly in arid and coastal areas. Solar-Powered Desalination uses solar energy to power desalination plants, converting seawater into clean, drinkable water. This sustainable solution addresses the dual challenges of water scarcity and energy consumption, providing an eco-friendly alternative to traditional desalination methods.
# The initiative supports communities struggling with limited access to fresh water, improving public health and enabling agricultural activities. By utilizing abundant solar resources, the project minimizes its carbon footprint and operational costs. Solar-Powered Desalination offers a scalable solution to one of the most urgent global challenges."
# ]






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

  # project.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

    project = Project.create!(
      user: user1,
      title: titles[number],
      address: addresses[number],
      region: regions[number],
      description: descriptions[number],
      auditor: auditors[number],
      target: (5000000..10000000).to_a.sample,
      progress: 0
    )
    Donation.create!(
      project: project,
      user: user1,
      donation_sku: "#{project.title.split.join('_')}_donation",
      amount: (500000..10000000).to_a.sample,
      state: "paid"
    )

    Category.create!(
      project: project,
      name: renewable_energy_keywords[number]
    )

  number += 1
end

puts "Project Created: #{Project.count}"
