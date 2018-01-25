require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  let!(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /v1/orders' do
    before do
      3.times { FactoryBot.create(:restaurant) }
      3.times { FactoryBot.create(:menu, restaurant: Restaurant.first) }
      3.times { FactoryBot.create(:product_category, menu: Menu.first) }
      3.times { FactoryBot.create(:product, product_category: ProductCategory.first) }
    end

    it 'should create an order' do
      post '/api/v1/orders', params: {
        product: Product.first.id
      }, headers: headers
      expect(response.status).to eq 200
      expected_response = eval(file_fixture('current_order.txt').read)
      expect(response_json).to eq expected_response.as_json
    end
  end
end
