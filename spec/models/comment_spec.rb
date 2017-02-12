require 'rails_helper'

describe Comment do
  describe "validations" do
    let(:comment) { Fabricate(:comment) }
    context "invalid attributes" do
      it { should validate_presence_of(:content)}
    end
  end
end
