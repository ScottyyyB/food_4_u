class Api::V1::OrdersController < ApplicationController
  before_action :get_product

  def create
    order = Order.create
    order.add(@product, @product.price)
    if order.persisted?
      render json: order, serializer: OrderSerializer
    end
  end

  private

  def get_product
    @product = Product.find(params[:product])
  end
end
