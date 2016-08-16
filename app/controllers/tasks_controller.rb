class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_parameters) # error forbidden attributes
    @task.completed = false
    @task.save
    redirect_to action: "index"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_parameters)
    redirect_to action: "index"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to action: "index"
  end

  def task_parameters
    params.require(:task).permit(:name, :completed)
  end


end




