class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus.all
    @reviews = @restaurant.reviews.all
  end
end
