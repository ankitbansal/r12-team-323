class HomeController < ApplicationController

  def index
    redirect_to :promo and return if(!mobile_device?) && Rails.env != "development"
    redirect_to projects_path(current_user) and return if current_user
    render :layout => 'index'
  end

  def promo
  end
  def promo
    render :layout => 'promo'
  end
end
