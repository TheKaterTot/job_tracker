require "rails_helper"

feature "User deletes a job" do
  let!(:company) { Fabricate(:company) }
  let!(:job) { Fabricate(:job, company_id: company.id) }
  scenario "they visit show" do
    visit company_job_path(company, job)

    expect{ click_on "Delete" }.to change{Job.count}.from(1).to(0)
    expect(current_path).to eq(company_jobs_path(company))
  end
end
