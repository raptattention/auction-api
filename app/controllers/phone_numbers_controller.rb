class PhoneNumbersController < ApplicationController
	before_action :set_phone_number, only: [:show, :update, :destroy]

	# GET /phone_numbers
	def index
    @phone_numbers = PhoneNumber.all
    json_response(@phone_numbers)
  end

  # POST /phone_numbers
  def create
    @phone_number = PhoneNumber.create!(phone_number_params)
    json_response(@phone_number, :created)
  end

  # PUT /phone_number/:id
  def update
    @phone_number.update(phone_number_params)
    json_response(@phone_number, :created)
  end

  # GET /phone_number/:id
  def show
    json_response(@phone_number)
  end

  # DELETE /phone_number/:id
  def destroy
    @phone_number.destroy
    head :no_content
  end

  private

  def phone_number_params
    params.permit(:country, :phone_number)
  end

  def set_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end
end
