class BidsController < ApplicationController
	before_action :set_product
	before_action :set_bid, only: [:show, :update, :destroy]

	# GET /products/:product_id/bids
	def index
    json_response(@product.bids)
  end

  # POST /products/:product_id/bids
  def create
    @bid = @product.bids.create!(bid_params)
    json_response(@bid, :created)
  end

  # PUT /products/:product_id/bids/:id
  def update
    @bid.update(bid_params)
    json_response(@bid, :created)
  end

  # GET /products/:product_id/bids/:id
  def show
    json_response(@bid)
  end

  # DELETE /products/:product_id/bids/:id
  def destroy
    @bid.destroy
    head :no_content
  end

  private

  def bid_params
    params.permit(:user_id, :product_id, :bidding_date, :price)
  end

  def set_product
    @product = Product.find_by!(id: params[:product_id])
  end

  def set_bid
    @bid = @product.bid.find_by!(id: params[:id]) if @product
  end
end
