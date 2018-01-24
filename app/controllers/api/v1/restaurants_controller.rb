class Api::V1::RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all
    render json: restaurants, each_serializer: RestaurantSerializer
  end

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant.menus, each_serializer: MenuSerializer#, include: ['product_categories']
  end
end