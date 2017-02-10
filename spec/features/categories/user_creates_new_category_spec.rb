require "rails_helper"

feature "User creates a new category" do
  scenario "with valid info" do
    visit new_category_path

    fill_in "category[title]", with: "Bleep"
    click_on "Create"

    expect(current_path).to eq(category_path(Category.last.id))
    expect(page).to have_content("Bleep")
    expect(Category.count).to eq(1)
  end

  scenario "with invalid info" do
    visit new_category_path

    fill_in "category[title]", with: ""
    click_on "Create"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Title can't be blank")
  end
end
