require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  let!(:headers) { { HTTP_ACCEPT: 'application/json' } }

    before do
      3.times { FactoryBot.create(:restaurant) }
      3.times { FactoryBot.create(:menu, restaurant: Restaurant.first) }
      3.times { FactoryBot.create(:product_category, menu: Menu.first) }
      3.times { FactoryBot.create(:product, product_category: ProductCategory.first) }
      1.times { Order.create.add(Product.first, Product.first.price) }
    end

  describe 'POST /v1/orders' do
    it 'should create an order' do
      post '/api/v1/orders', params: {
        product: Product.first.id
      }, headers: headers
      expect(response.status).to eq 200
      expected_response = eval(file_fixture('current_order.txt').read)
      expect(response_json).to eq expected_response.as_json
    end
  end

  describe 'PUT /v1/orders' do
    it 'should update an order' do
      put "/api/v1/orders/#{Order.last.id}", params: {
        product: Product.second.id
      }, headers: headers
      expect(response.status).to eq 200
      expected_response = eval(file_fixture('update_order.txt').read)
      expect(response_json).to eq expected_response.as_json
    end
  end

  describe 'GET /v1/orders/order_id' do
    it 'should return an order' do
      get "/api/v1/orders/#{Order.last.id}"
      expect(response.status).to eq 200
      expected_response = eval(file_fixture('show_order.txt').read)
      expect(response_json).to eq expected_response.as_json
    end
  end
end
