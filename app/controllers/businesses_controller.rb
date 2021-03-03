class BusinessesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :search]

  def index
    @businesses = Business.all

     @markers = @businesses.geocoded.map do |business|
        {
          lat: business.latitude,
          lng: business.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { business: business })
        }
      end
  end

  def show
    @business = Business.find_by(slug: params[:slug])
  end

  def search
    if params[:query].present?
    @businesses = Business.search(params[:query], where: {business_id: params[:business][:id]})
    else
    @businesses = Business.all
    end
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to businesses_path
    else
      redirect_to businesses_path
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address,:style, :website, :phone_number,photos: [])
  end

end
