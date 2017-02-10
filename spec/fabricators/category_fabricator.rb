Fabricator(:category) do
  title { Faker::Pokemon.unique.name }
end
