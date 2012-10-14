class InvitationsController < ApplicationController
  def show
    @invitation = Invitation.find_by_id(params[:id])
  end
end
