require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  #before(:each) do
  subject {FactoryBot.create(:restaurant, street_address: "Hantverkargatan 28", post_code: "11220", city: "Stockholm") }
  #end
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
    it { is_expected.to validate_inclusion_of(:assortment).in_array(Restaurant::VALID_ASSORTMENT)}
  end

  describe 'Relations' do
    it { is_expected.to have_many :menus }
  end

  describe '#full_address' do
    it 'sets the full_address using geocoder' do
      expect(subject.full_address).to eq "Hantverkargatan 28, 112 21 Stockholm, Sweden"
    end
  end

  describe FactoryBot do
    it 'should be valid' do
      expect(FactoryBot.create(:restaurant)).to be_valid
    end
  end
end
