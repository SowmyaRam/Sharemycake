# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Organization.delete_all
Organization.create!(id: 1,
  orgn_title: 'Save the Children',
  orgn_desc: 
    %{<p>
      Save the Children gives children in the United States and around the world what every 
      child deserves – a healthy start, the opportunity to learn and protection from harm. 
      When disaster strikes, we put children's needs first. We advocate for and achieve l
      arge-scale change for children. We save children's lives. Join us.
      </p>},
  orgn_website: 'http://www.savethechildren.org/',
  orgn_image_url:   'save_children_orgn.jpg'
)
# . . .
Organization.create!(id: 2,
  orgn_title: 'World Cancer Research Fund International',
  orgn_desc: 
    %{<p>
      World Cancer Research Fund International (WCRF International) leads and unifies a global 
      network of cancer charities dedicated to the prevention and control of cancer by means 
      of healthy food and nutrition, physical activity and body weight.
      </p>},
  orgn_website: 'http://www.wcrf.org',
  orgn_image_url:   'cancer_orgn.jpg'
)
# . . .
Organization.create!(id: 3,
  orgn_title: 'Global Health Research Foundation',
  orgn_desc: 
    %{<p>
      Global Health Research Foundation brings together a diverse group of people, including specialists in
      Medicine, Environment, Mobile and Health Information Technology, Disaster and Trauma Systems,
      Engineering, History, Art. All with the common goal of improving health throughout the world 
      from a cultural and community perspective. 
      </p>},
  orgn_website: 'http://www.ghrf.org',
  orgn_image_url:   'Global_health_orgn.jpg'
)
# . . .
Organization.create!(id: 4,
  orgn_title: 'National Poverty Eradication Programme',
  orgn_desc: 
    %{<p>
      The National Poverty Eradication Programme (NAPEP) was formed to fund and manage the activities of 
      agencies involved in combating poverty which includes National Directorate of Employment (NDE). 
      NDE and NAPEP collaborated in the Vocational Skills acquisition training of 25,000 youths.
      </p>},
  orgn_website: 'http://nigeria.thebeehive.org/',
  orgn_image_url:   'poverty_erad_orgn.gif'
)