class Api::V1::OrdersController < ApplicationController
  before_action :get_product

  def create
    order = Order.create
    order.add(@product, @product.price)
    if order.persisted?
      session[:order_id] = order.id
      render json: { order: session[:order_id] }
    end
  end

  private

  def get_product
    @product = Product.find(params[:product])
  end
end
