require 'rails_helper'

describe Job do
  describe "validations" do
    let!(:company) { Fabricate(:company) }
    let!(:category) { Fabricate(:category) }
    context "invalid attributes" do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:level_of_interest) }
      it { should validate_presence_of(:city) }
      it { should validate_presence_of(:company) }
      it { should validate_presence_of(:category) }
    end
  end

  describe "relationships" do
    it { should belong_to(:company) }
    it { should belong_to(:category) }
  end
end
