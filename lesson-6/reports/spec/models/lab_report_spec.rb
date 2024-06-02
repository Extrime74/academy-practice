require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let!(:user) { User.create(email: 'example@example.com', first_name: 'first name', last_name: 'last name') }
    subject { LabReport.new(title:, description:, grade:).valid? }

    context 'Creating a new record with valid attributes' do
      let(:title) { 'Title 1' }
      let(:description) { 'Description 1' }
      let(:grade) { 'A' }

      it 'The check runs without errors' do
        expect(subject).to eq(true)
      end
    end

    context 'Creating a new record with invalid attributes' do
      let(:title) { 'Title 1' }
      let(:description) { 'Description 1' }
      let(:grade) { '3' }

      it 'The check runs without errors' do
        expect(subject).to eq(false)
      end
    end
  end
end
