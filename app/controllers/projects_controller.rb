class ProjectsController < ApplicationController

  before_filter :check_for_login

  def new
    @project = Project.new
    graph = Koala::Facebook::API.new(session[:token])
    @friends = graph.get_connections("me", "friends")
  end

  def create
    @project = Project.new(params[:project])
    @project.owner = current_user
    @project.invitations = params[:invites].values.collect do |invite|
                                 invitation = Invitation.new
                                 invitation.fb_id = JSON.parse(invite)["fb_id"]
                                 invitation
                               end if params[:invites]

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
    @projects = Project.where(:owner_id => current_user)
    @invitations = Invitation.where(:accepted => nil, :fb_id => current_user.uid)
    @accepted_invitations = Invitation.where(:accepted => true, :fb_id => current_user.uid)
    @joined_projects = @accepted_invitations.collect(&:project)
  end

  def show
    @project = Project.find(params[:id])
    @comment = @project.comments.new
    @pics = InstagramImage.find_by_tag(@project.instagram_tag)
    @todos = Todo.find_all_by_project_id(@project.id)


      respond_to do |format|
          format.html # show.html.erb
          format.xml { render :xml => @project }
      end
  end

  def dashboard
    @project = Project.find(params[:id])
    @reached_count = @project.project_users.where(:user_id => current_user.id, :reached => true).count
  end

  def reached
    @project = Project.find(params[:id])
    project_user = @project.project_users.where(:user_id => current_user.id).first
    project_user.update_reached_flag(true) if project_user.present?
    redirect_to projects_path(current_user)
  end
end
