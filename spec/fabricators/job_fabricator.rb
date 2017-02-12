Fabricator(:job) do
  title "Cog"
  description "Work work work"
  level_of_interest { Faker::Number.number(1) }
  city "Death Star"
  company
  category
end
