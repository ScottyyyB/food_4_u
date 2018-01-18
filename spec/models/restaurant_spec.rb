require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :city }
    it { is_expected.to have_db_column :post_code }
    it { is_expected.to have_db_column :street_address }
    it { is_expected.to have_db_column :longitude }
    it { is_expected.to have_db_column :latitude }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :post_code }
    it { is_expected.to validate_presence_of :street_address }

  end

  describe 'Relations' do
    it { is_expected.to have_many :menus }
  end

  describe FactoryBot do
    it 'should be valid' do
      expect(FactoryBot.create(:restaurant)).to be_valid
    end
  end
end
