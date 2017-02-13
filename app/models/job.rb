class JobCount < Struct.new(:level_of_interest, :count)
end

class JobLocation < Struct.new(:name, :job_count)
end

class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :company, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.count_by_level_of_interest
    jobs = group(:level_of_interest).order("level_of_interest desc")
                                    .select("level_of_interest, count(*)")
    jobs.map do |job|
      JobCount.new(job.level_of_interest, job.attributes["count"])
    end
  end

  def self.job_locations
    locations = group(:city).select("city, count(*)")
    locations.map do |location|
      JobLocation.new(location.city, location.attributes["count"])
    end
  end
end
