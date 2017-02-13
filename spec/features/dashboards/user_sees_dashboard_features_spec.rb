require "rails_helper"

feature "user views dashboard" do
  scenario "user sees job count by level of interest" do
    Fabricate.times(5, :job, level_of_interest: 4)
    Fabricate.times(3, :job, level_of_interest: 7)

    visit dashboard_path

    expect(page).to have_content("You have 5 jobs with level of interest 4.")
    expect(page).to have_content("You have 3 jobs with level of interest 7.")
  end

  scenario "user sees top three companies" do
    c1, c2, c3, c4 = Fabricate.times(4, :company)
    Fabricate(:job, level_of_interest: 3, company: c1)
    Fabricate(:job, level_of_interest: 9, company: c1)
    Fabricate(:job, level_of_interest: 4, company: c2)
    Fabricate(:job, level_of_interest: 9, company: c3)
    Fabricate(:job, level_of_interest: 1, company: c3)
    Fabricate(:job, level_of_interest: 8, company: c4)

    visit dashboard_path

    within("#top-three-companies") do
      expect(page).to_not have_content(c2.name)
      expect(page).to have_content("#{c1.name} has an average of 6")
      expect(page).to have_content("#{c3.name} has an average of 5")
      expect(page).to have_content("#{c4.name} has an average of 8")
    end
  end

  scenario "user sees jobs by location" do
    Fabricate(:job, city: "Denver")
    Fabricate(:job, city: "Denver")
    Fabricate(:job, city: "Tulsa")

    visit dashboard_path

    within("#jobs-by-location") do
      expect(page).to have_content("2 jobs in Denver")
      expect(page).to have_content("1 job in Tulsa")
      click_on "Denver"
      expect(page).to have_current_path(jobs_path(location: "Denver"))
    end
  end
end
