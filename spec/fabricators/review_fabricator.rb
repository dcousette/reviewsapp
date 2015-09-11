Fabricator(:review) do 
  rating { (1..5).to_a.sample }
  content { Faker::Lorem.paragraph }
  restaurant_id { (1..3).to_a.sample }
end