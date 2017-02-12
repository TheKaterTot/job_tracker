require 'rails_helper'

describe "User sees a specific job" do
  let!(:company) { Fabricate(:company) }
  let!(:category) { Fabricate(:category) }
  scenario "a user sees a job for a specific company" do
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content(category.title)
  end
end
