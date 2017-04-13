class PhoneNumbersController < ApplicationController
	before_action :set_user
	before_action :set_phone_number, only: [:show, :update, :destroy]

	# GET /area_codes/:id/phone_numbers
	def index
		@area_code = AreaCode.find_by!(id: params[:id])
    json_response(@area_code.phone_number)
  end

  # POST /users/:id/phone_number
  def create
    @phone_number = @user.phone_number.create!(phone_number_params)
    json_response(@phone_number, :created)
  end

  # PUT /users/:id/phone_number
  def update
    @phone_number.update(phone_number_params)
    json_response(@phone_number, :created)
  end

  # GET /users/:user_id/phone_number
  def show
    json_response(@phone_number)
  end

  # DELETE /users/:id/phone_number
  def destroy
    @phone_number.destroy
    head :no_content
  end

  private

  def phone_number_params
    params.permit(:area_code_id, :phone_number)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_phone_number
    @phone_number = @user.phone_number if @user
  end
end
