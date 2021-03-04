class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :search

  def search
    if params[:query].present?
    @businesses = Business.search(params[:query], where: {business_id: params[:business][:id]})
    else
    @businesses = Business.all
    end
  end
end
