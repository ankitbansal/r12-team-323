class TodosController < ApplicationController
  def create
    @todo = Todo.new params['todo']
    head :ok and return if @todo.save
    render :text => "Oops!", :status => 403
  end

  def index
    project_id = params['project_id']
    @todos = Todo.find_all_by_project_id(project_id)
    render :partial => 'projects/todo_list', :layout => false
  end

  def flip
    todo = Todo.find(params[:id])
    todo.done = !todo.done
    todo.save!
    render :nothing => true
  end
end
