require 'rails_helper'

describe "User creates a new job" do
  let!(:company) { Fabricate(:company) }
  let!(:category) { Fabricate(:category) }
  scenario "a user can create a new job" do
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select(category.title, :from => 'Category')

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content(company.name)
    expect(page).to have_content(category.title)
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end

  scenario "a user can click create category" do
    visit new_company_job_path(company)

    click_on "Create Category"

    expect(current_path).to eq(new_category_path)
  end
end
