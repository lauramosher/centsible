# frozen_string_literal: true

require "rails_helper"

RSpec.describe Category, type: :model do
  describe "validations" do
    it "invalid when name is blank" do
      category = build_stubbed(:category, name: "")

      expect(category).not_to be_valid
    end

    it "valid when name is present" do
      category = build_stubbed(:category, name: "Category")

      expect(category).to be_valid
    end

    it "invalid when active categories name is duplicated" do
      create(:category, name: "Duplicate")
      category = build_stubbed(:category, name: "Duplicate")

      expect(category).not_to be_valid
    end

    it "valid if name inactive categories name is duplicated" do
      create(:category, :archived, name: "Duplicate")
      category = build_stubbed(:category, name: "Duplicate")

      expect(category).to be_valid
    end

    it "invalid when budget is blank" do
      category = build_stubbed(:category, budget: nil)

      expect(category).not_to be_valid
    end

    it "valid when budget is present" do
      category = build_stubbed(:category, budget: 3.6)

      expect(category).to be_valid
    end

    it "invalid when budget is negative" do
      category = build_stubbed(:category, budget: -5)

      expect(category).not_to be_valid
    end

    it "valid when budger is zeroed" do
      category = build_stubbed(:category, budget: 0)

      expect(category).to be_valid
    end
  end
end
