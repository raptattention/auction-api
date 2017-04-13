class BidsController < ApplicationController
	before_action :set_user
	before_action :set_bid, only: [:show, :update, :destroy]

	# GET /user/:user_id/bids
	def index
    json_response(@user.bids)
  end

  # POST /user/:user_id/bids
  def create
    @bid = @user.bids.create!(bid_params)
    json_response(@bid, :created)
  end

  # PUT /user/:user_id/bids/:id
  def update
    @bid.update(bid_params)
    json_response(@bid, :created)
  end

  # GET /user/:user_id/bids/:id
  def show
    json_response(@bid)
  end

  # GET /product/:product_id/bids
  def show_product_bids
  	@product = Product.find_by!(id: params[:product_id])
    json_response(@product.bids)
  end

  # DELETE /user/:user_id/bids/:id
  def destroy
    @bid.destroy
    head :no_content
  end

  private

  def bid_params
    params.permit(:user_id, :product_id, :bidding_date, :price)
  end

  def set_user
    @user = User.find_by!(id: params[:user_id])
  end

  def set_bid
    @bid = @user.bid.find_by!(id: params[:id]) if @user
  end
end
