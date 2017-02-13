class DashboardController < ApplicationController

  def index
    @level_of_interest = Job.count_by_level_of_interest
    @top_three_companies = Company.top_three_companies
    @job_locations = Job.job_locations
  end

end
