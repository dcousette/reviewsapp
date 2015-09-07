Fabricator(:restaurant) do 
  name { Faker::Company.name }
  description { Faker::Lorem.paragraph }
  category_id { 1 }
end