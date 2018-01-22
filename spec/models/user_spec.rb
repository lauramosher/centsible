require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is invalid when email is blank" do
      user = build(:user, email: nil)

      expect(user).not_to be_valid
    end

    it "is invalid when malformed email" do
      user = build(:user, email: "bademail")

      expect(user).not_to be_valid
    end

    it "is valid when email is set" do
      user = build(:user, email: "my@email.com")

      expect(user).to be_valid
    end

    it "is invalid when won't save blank email on persisted" do
      user = create(:user)
      user.attributes = {email: nil}

      expect(user).not_to be_valid
    end

    it "is invalid when won't save malformed email on persisted" do
      user = create(:user)
      user.attributes = {email: "bademail"}

      expect(user).not_to be_valid
    end

    it "is valid when will save email on persisted" do
      user = create(:user)
      user.attributes = {email: "my@email.com"}

      expect(user).to be_valid
    end

    it "is invalid when password is too short" do
      user = build(:user, password: "short", password_confirmation: "short")

      expect(user).not_to be_valid
      expect(user.errors.messages[:password]).to include("is too short (minimum is 6 characters)");
    end

    it "is invalid when password mismatches password confirmation" do
      user = build(:user, password: "notshort", password_confirmation: "short")

      expect(user).not_to be_valid
      expect(user.errors.messages[:password_confirmation]).to include("doesn't match Password");
    end

    it "is invalid when password and password confirmation are nil (and unpersisted)" do
      user = build(:user, password: nil, password_confirmation: nil)

      expect(user).not_to be_valid
    end

    it "is invalid when password mismatches password confirmation (and persisted)" do
      user = create(:user)
      user.attributes = {password: "bad", password_confirmation: nil}

      expect(user).not_to be_valid
    end

    it "is valid when password and password confirmation are nil (and persisted)" do
      user = create(:user)
      user.attributes = {password: nil, password_confirmation: nil}

      expect(user).to be_valid
    end
  end
end
