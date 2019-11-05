class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # pick up info on the params and create a new task with the info
    @task.save
    # save it
    redirect_to tasks_path
    # redirect to another page
  end

  def edit
  end

  def update
    @task.update(task_params)
    # pick up info on the params and update the task
    redirect_to @task
    # redirect to another page
  end

  def destroy
    @task.destroy
    # delete the task
    redirect_to tasks_path
    # redirect to another page
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
