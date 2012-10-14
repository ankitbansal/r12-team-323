class InvitationsController < ApplicationController
  def show
    @invitation = Invitation.find_by_id(params[:id])
  end
  
  def join
    @invitation  = Invitation.find_by_id(params[:id])
    project = @invitation.project
    project.users << current_user
    project.save!
    
    @invitation.accepted = true
    @invitation.save!
    redirect_to projects_path(current_user)
  end
  
  def cancel
    @invitation  = Invitation.find_by_id(params[:id]) 
    @invitation.accepted = false
    @invitation.save!
    redirect_to projects_path(current_user)
  end
end
