require 'rails_helper'

RSpec.describe LabReport, type: :model do
  it "is valid with all required attributes" do
    lab_report = FactoryBot.create(:lab_report)
    expect(lab_report).to be_valid
  end

  it "is invalid without a title" do
    lab_report = FactoryBot.build(:lab_report, title: nil)
    expect(lab_report).to be_invalid
  end

  it "is invalid without a description" do
    lab_report = FactoryBot.build(:lab_report, description: nil)
    expect(lab_report).to be_invalid
  end

  it "is invalid with a title longer than 250 characters" do
    lab_report = FactoryBot.build(:lab_report, title: Faker::Lorem.characters(number: 251))
    expect(lab_report).to_not be_valid
  end

  it "is invalid with a description longer than 500 characters" do
    lab_report = FactoryBot.build(:lab_report, description: Faker::Lorem.characters(number: 501))
    expect(lab_report).to_not be_valid
  end

  it "is valid with a grade of A, B, C, D, E, FX, or F" do
    valid_grades = %w[A B C D E FX F]
    valid_grades.each do |grade|
      lab_report = FactoryBot.build(:lab_report, grade: grade)
      expect(lab_report).to be_valid
    end
  end

  it "is invalid with a grade other than A, B, C, D, E, FX, or F" do
    invalid_grades = %w[G K Z 123 *]
    invalid_grades.each do |grade|
      lab_report = FactoryBot.build(:lab_report, grade: grade)
      expect(lab_report).to_not be_valid
    end
  end
end
