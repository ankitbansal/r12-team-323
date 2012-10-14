class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @project
    end
  end

  def index
    @project = Project.find(params[:project_id])
    render :template => 'projects/_comments', :layout => false
  end
end
