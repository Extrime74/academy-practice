require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to be_invalid
  end

  it "is invalid with an email longer than 150 characters" do
    user = FactoryBot.build(:user, email: Faker::Lorem.characters(number: 151))
    expect(user).to be_invalid
  end

  it "is valid with a valid email format" do
    valid_emails = ["user@example.com", "another.user@example.co.uk", "user123@test.com"]
    valid_emails.each do |email|
      user = FactoryBot.build(:user, email: email)
      expect(user).to be_valid
    end
  end

  it "is invalid with an invalid email format" do
    invalid_emails = ["invalid_email", "user@.com", "user@example"]
    invalid_emails.each do |email|
      user = FactoryBot.build(:user, email: invalid_emails)
      expect(user).to be_invalid
    end
  end

  it "is valid with a first name of maximum 100 characters" do
    user = FactoryBot.build(:user, first_name: Faker::Lorem.characters(number: 100))
    expect(user).to be_valid
  end

  it "is invalid with a first name longer than 100 characters" do
    user = FactoryBot.build(:user, first_name: Faker::Lorem.characters(number: 101))
    expect(user).to be_invalid
  end

  it "is valid with a last name of maximum 100 characters" do
    user = FactoryBot.build(:user, last_name: Faker::Lorem.characters(number: 100))
    expect(user).to be_valid
  end

  it "is invalid with a last name longer than 100 characters" do
    user = FactoryBot.build(:user, last_name: Faker::Lorem.characters(number: 101))
    expect(user).to be_invalid
  end

  it "is associated with lab_reports" do
    expect(User.reflect_on_association(:lab_reports).macro).to eq(:has_many)
  end
end