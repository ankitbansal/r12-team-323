class HomeController < ApplicationController

  def index
    redirect_to :promo and return if(!mobile_device?) && Rails.env != "development"
    redirect_to projects_path(current_user) if current_user
  end

  def promo
  end
end
