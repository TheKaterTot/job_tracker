require "rails_helper"

feature "User updates a job" do
  let!(:job) { Fabricate(:job) }
  context "with valid info" do
    scenario "they visit edit" do
      visit edit_company_job_path(job.company, job)

      fill_in "job[title]", with: "Developer"
      fill_in "job[description]", with: "So fun!"
      fill_in "job[level_of_interest]", with: 80
      fill_in "job[city]", with: "Denver"

      click_button "Update"

      expect(current_path).to eq(company_job_path(job.company, job))
      expect(page).to have_content("Developer")
      expect(page).to have_content(80)
    end
  end

  context "with invalid info" do
    scenario "they see an error message" do
      visit edit_company_job_path(job.company, job)

      fill_in "job[title]", with: ""
      fill_in "job[description]", with: ""
      fill_in "job[level_of_interest]", with: ""
      fill_in "job[city]", with: ""
      click_button "Update"

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Level of interest can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(current_path).to eq(company_job_path(job.company, job))
    end
  end
end
