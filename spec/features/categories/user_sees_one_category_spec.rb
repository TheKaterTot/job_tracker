require "rails_helper"

feature "User sees one category" do
  let(:category) { Fabricate(:category) }
  let!(:job_1) { Fabricate(:job, category: category) }
  let!(:job_2) { Fabricate(:job, category: category) }
  scenario "they see all jobs in that category" do
    visit category_path(category)
  
    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
  end
end
