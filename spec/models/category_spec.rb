require 'rails_helper'

describe Category do
  describe "validations" do
    it "validates title is present" do
      category = Category.new(title: "")
      category.valid?
      expect(category.errors[:title]).to_not be_empty
    end

    it "validates title is unique" do
      category = Fabricate(:category)
      category_2 = Category.new(title: category.title)
      category_2.valid?
      expect(category_2.errors[:title]).to_not be_empty
    end
  end
end
