Fabricator(:company) do
  name { Faker::Company.unique.name }
end
