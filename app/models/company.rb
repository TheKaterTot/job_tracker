class CompanyAverage < Struct.new(:name, :average)
end

class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_three_companies
    companies = joins(:jobs).group("companies.id")
                .select("name, avg(level_of_interest)")
                .order("avg desc").limit(3)

    companies.map do |company|
      CompanyAverage.new(company.name, company.avg)
    end
  end
end
