class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :update, :destroy]

	# GET /orders
	def index
    @orders = Order.all
    json_response(@orders)
  end

  # POST /orders
  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  # PUT /order/:id
  def update
    @order.update(order_params)
    json_response(@order, :created)
  end

  # GET /order/:id
  def show
    json_response(@order)
  end

  # DELETE /order/:id
  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params
    params.permit(:country, :order)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
