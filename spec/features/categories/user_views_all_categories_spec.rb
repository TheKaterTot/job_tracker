require "rails_helper"

feature "User can view all categories" do
  let!(:category) { Fabricate(:category) }
  let!(:category_2) { Fabricate(:category) }
  scenario "a user visits index" do
    visit categories_path

    expect(page).to have_content(category.title)
    expect(page).to have_content(category_2.title)
  end
end
