require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :body }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
  end

  describe 'Relations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :restaurant }
  end

  describe FactoryBot do
    it 'should be valid' do
      expect(FactoryBot.create(:review)).to be_valid
    end
  end
end
