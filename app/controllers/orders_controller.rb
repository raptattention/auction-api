class OrdersController < ApplicationController
	before_action :set_product
	before_action :set_order, only: [:show, :update, :destroy]

	# GET /product/:product_id/order
	def index
    json_response(@product.order)
  end

  # POST /product/:product_id/order
  def create
    @order = @product.order.create!(order_params)
    json_response(@order, :created)
  end

  # PUT /product/:product_id/order
  def update
    @order.update(order_params)
    json_response(@order, :created)
  end

  # GET /product/:product_id/order
  def show
    json_response(@order)
  end

  # DELETE /product/:product_id/order
  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params
    params.permit(:bid_id, :order_date)
  end

  def set_product
  	@product = Product.find_by!(id: params[:product_id])
  end

  def set_order
    @order = @product.orders.find_by!(id: params[:id]) if @product
  end
end
