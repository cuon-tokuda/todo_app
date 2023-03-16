class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(id: :asc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create!(task_params)
    redirect_to task
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to @task
  end

  def destroy
    @task.destroy!
    redirect_to root_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
