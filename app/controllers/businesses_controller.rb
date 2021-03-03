class BusinessesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :search]

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find_by(slug: params[:slug])
  end

  def search
    @businesses = Business.all
    if params[:query].present?
    @businesss = Business.search(params[:query], where: {business_id: params[:business][:id]})
    else
    @businesses = Business.all
    end
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.create(business_params)
    if @business.save!
      redirect_to business_path(@business)
    else
      render 'new'
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address,:style, :website, :phone_number)
  end

end
