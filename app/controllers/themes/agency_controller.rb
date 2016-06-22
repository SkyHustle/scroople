class Themes::AgencyController < ApplicationController
  respond_to :json, :html

  def index
  end

  def show
    @user  = User.find(params[:id])
  end

  def create
    Agency.create(agency_params)
    redirect_to controller: 'agency', action: 'show', id: params[:agency][:user_id]
  end

  def update
    agency = Agency.find(params[:id])
    agency.update!(agency_params)

    respond_to do |format|
      format.html { respond_with :themes, agency }
      format.json { render json: { results: agency } }
    end
  end

  private

  def agency_params
    params.require(:agency).permit(:brand_logo, :header_image, :intro_lead_in, :intro_heading, :user_id, :services_subheading, :services_icon_1, :services_icon_1_heading, :services_icon_1_subheading, :services_icon_2, :services_icon_2_heading, :services_icon_2_subheading, :services_icon_3, :services_icon_3_heading, :services_icon_3_subheading, :portfolio_subheading)
  end
end
