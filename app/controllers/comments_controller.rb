class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(params[:comment])
    if @comment.save
      redirect_to @project
    end
  end
end
