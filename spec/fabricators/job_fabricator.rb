Fabricator(:job) do
  title "Cog"
  level_of_interest { Faker::Number.number(1) }
  city "Death Star"
  company
  category
end
