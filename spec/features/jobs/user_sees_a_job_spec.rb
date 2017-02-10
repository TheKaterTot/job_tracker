require 'rails_helper'

describe "User sees a specific job" do
  let!(:company) { Fabricate(:company) }
  scenario "a user sees a job for a specific company" do
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end
end
