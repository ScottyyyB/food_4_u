require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id}
    it { is_expected.to respond_to :order_items }
    it { is_expected.to respond_to :add }
  end
end
