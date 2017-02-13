require 'rails_helper'

describe "User sees all jobs" do
  let!(:company) { Fabricate(:company) }
  let!(:category) { Fabricate(:category) }
  scenario "a user sees all the jobs for a specific company" do
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end

  scenario "a user sees jobs in order by city" do
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "New York City", category_id: category.id)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_jobs_path(company, sort: "location")

    list_items = all("li p").map { |item| item.text }
    expect(list_items).to eq(["#{job_2.title} at #{job_2.company.name}",
                              "#{job_1.title} at #{job_1.company.name}"])
  end
end
