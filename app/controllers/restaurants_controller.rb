class RestaurantsController < ApplicationController

  def index
    if params[:search]
      @assortment = params[:assortment]
      @results = Restaurant.all.select { |restaurant| restaurant.assortment.include? @assortment.capitalize }
      flash[:danger] = 'No restaurants found.' if @results.none?
      render :index
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus.all
  end

  # def search
  #   @assortment = params[:assortment]
  #   @results = Restaurant.all.select { |restaurant| restaurant.assortment.include? @assortment.capitalize }
  #   flash[:danger] = 'No restaurants found.' if @results.none?
  #   render :index
  # end

end
