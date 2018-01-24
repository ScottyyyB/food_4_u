require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :request do

  describe 'GET /v1/restaurants' do

    before do
      3.times { FactoryBot.create(:restaurant) }
    end

    it 'should return a restaurant' do
      get '/api/v1/restaurants'
      expect(response.status).to eq 200
      expected_response = eval(file_fixture('restaurants.txt').read)
      expect(response_json).to eq expected_response.as_json
    end
  end
end