class TodosController < ApplicationController
  def create
    p params
    @todo = Todo.new params['todo']
    head :ok and return if @todo.save
    render :text => "Oops!", :status => 403
  end

  def index
    project_id = params['project_id']
    @todos = Todo.find_all_by_project_id(project_id)
    render :json => @todos.collect(&:attributes).to_json
  end
end
