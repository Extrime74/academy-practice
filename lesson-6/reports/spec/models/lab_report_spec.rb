require 'rails_helper'

RSpec.describe LabReport, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:lab_report)).to be_valid
  end
end