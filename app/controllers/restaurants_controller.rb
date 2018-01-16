class RestaurantsController < ApplicationController

  def index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus.all
  end

  def search
    @assortment = params[:assortment]
    @results = Restaurant.all.select { |restaurant| restaurant.assortment.include? params[:assortment] }
    render :index
  end
end
