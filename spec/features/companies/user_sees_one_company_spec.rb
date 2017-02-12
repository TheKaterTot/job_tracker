require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    category = Fabricate(:category)
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  scenario "they create a contact" do
    company = Fabricate(:company)

    visit company_path(company)

    fill_in "First Name", with: "Bob"
    fill_in "contact[last_name]", with: "Loblaw"
    fill_in "contact[position]", with: "Attorney"
    fill_in "contact[email]", with: "bobloblaw@example.com"

    click_button "Create Contact"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Bob Loblaw")
    expect(page).to have_content("Attorney")
    expect(page).to have_content("bobloblaw@example.com")
  end
end
