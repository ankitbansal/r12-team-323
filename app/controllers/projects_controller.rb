class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

       respond_to do |format|
         if @project.save
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
    render :layout => false
  end

  def show
    @project = Project.find(params[:id])

      respond_to do |format|
          format.html # show.html.erb
          format.xml { render :xml => @project }
      end
  end
end
