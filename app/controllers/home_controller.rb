class HomeController < ApplicationController
   
  def index
    p "hellohellohellohellohellohellohellohellohello"
    p current_user
    if current_user
      redirect_to projects_path(current_user)
    end
  end
end
