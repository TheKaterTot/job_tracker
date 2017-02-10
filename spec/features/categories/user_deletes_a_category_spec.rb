require "rails_helper"

feature "User deletes a category" do
  let!(:category) { Fabricate(:category) }
  scenario "they visit index" do
    visit categories_path

    expect{ click_on "Delete" }.to change{Category.count}.from(1).to(0)
    expect(current_path).to eq(categories_path)
  end
end
