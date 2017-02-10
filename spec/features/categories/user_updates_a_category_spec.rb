require "rails_helper"

feature "User updates a category" do
  let!(:category) { Fabricate(:category) }
  context "with valid info" do
    scenario "they visit edit" do
      visit edit_category_path(category)

      fill_in "category[title]", with: "Tech"

      click_button "Update"

      category.reload
      expect(current_path).to eq(category_path(category))
      expect(page).to have_content("Tech")
    end
  end
end
