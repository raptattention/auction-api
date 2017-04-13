class BidsController < ApplicationController
	before_action :set_bid, only: [:show, :update, :destroy]

	# GET /bids
	def index
    @bids = Bid.all
    json_response(@bids)
  end

  # POST /bids
  def create
    @bid = Bid.create!(bid_params)
    json_response(@bid, :created)
  end

  # PUT /bid/:id
  def update
    @bid.update(bid_params)
    json_response(@bid, :created)
  end

  # GET /bid/:id
  def show
    json_response(@bid)
  end

  # DELETE /bid/:id
  def destroy
    @bid.destroy
    head :no_content
  end

  private

  def bid_params
    params.permit(:user_id, :product_id, :bidding_date, :price)
  end

  def set_bid
    @bid = Bid.find(params[:id])
  end
end
