class ProjectsController < ApplicationController

  def new
    @project = Project.new
    graph = Koala::Facebook::API.new(session[:token])
    @friends = graph.get_connections("me", "friends")
  end

  def create
    @project = Project.new(params[:project])
    @project.user = current_user

       respond_to do |format|
         if @project.save!
           format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
           format.xml { render :xml => @project, :status => :created, :location => @project }
         else
           format.html { render :action => "new" }
           format.xml { render :xml => @project.errors, :status => :unprocessable_entity }
         end
       end
  end

  def index
    @projects = Project.all
    @invitations = Invitation.all
  end

  def show
    @project = Project.find(params[:id])

      respond_to do |format|
          format.html # show.html.erb
          format.xml { render :xml => @project }
      end
  end
end
