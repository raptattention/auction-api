class AreaCodesController < ApplicationController
	before_action :set_area_code, only: [:show, :update, :destroy]

	# GET /area_codes
	def index
    @area_codes = AreaCode.all
    json_response(@area_codes)
  end

  # POST /area_codes
  def create
    @area_code = AreaCode.create!(area_code_params)
    json_response(@area_code, :created)
  end

  # PUT /area_codes/:id
  def update
    @area_code.update(area_code_params)
    json_response(@area_code, :created)
  end

  # GET /area_codes/:id
  def show
    json_response(@area_code)
  end

  # DELETE /area_codes/:id
  def destroy
    @area_code.destroy
    head :no_content
  end

  private

  def area_code_params
    params.permit(:country, :area_code)
  end

  def set_area_code
    @area_code = AreaCode.find(params[:id])
  end
end
