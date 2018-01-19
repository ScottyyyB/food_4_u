require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_inclusion_of(:assortment).in_array(Restaurant::VALID_ASSORTMENT)}
  end

  describe 'Relations' do
    it { is_expected.to have_many :menus }
    it { is_expected.to have_many :reviews }
  end

  describe FactoryBot do
    it 'should be valid' do
      expect(FactoryBot.create(:restaurant)).to be_valid
    end
  end
end
