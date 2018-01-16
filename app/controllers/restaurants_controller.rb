class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus.all
  end

  def search
    @assortment = params[:assortment]
    @results = Restaurant.all.select { |restaurant| restaurant.assortment.include? @assortment.capitalize }
    render :index
  end
end
