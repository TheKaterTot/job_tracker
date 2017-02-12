require "rails_helper"

feature "user can add new comment" do
  let(:job) { Fabricate(:job) }
  scenario "visits job show page" do
    visit company_job_path(job.company, job)

    fill_in "comment[content]", with: "What a great job"

    click_on "Create Comment"

    expect(page).to have_content("What a great job")

  end
end
