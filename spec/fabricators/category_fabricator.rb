Fabricator(:category) do
  name { Faker::Commerce.department(1, true) }
  slug ""
end
