class Api::V1::OrdersController < ApplicationController
  before_action :get_product, except: [:show]

  def create
    order = Order.create
    order.add(@product, @product.price)
    render json: order, serializer: OrderSerializer if order.persisted?
  end

  def update
    order = Order.find(params[:id])
    order.add(@product, @product.price)
    if order.persisted?
      render json: { message: "#{@product.name} has been added to the order." }
    end
  end

  def show
    order = Order.find(params[:id])
    render json: order, serializer: OneOrderSerializer
  end

  private

  def get_product
    @product = Product.find(params[:product])
  end
end
