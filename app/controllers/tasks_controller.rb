class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  PER_PAGE = 5

  def index
    @tasks = Task.order(id: :asc).where.not(status: :completed)
    @q = Task.ransack(params[:q])
    @tasks = @q.result.where.not(status: :completed).order(id: :asc).page(params[:page]).per(PER_PAGE)
  end

  def show
  end

  def new
    @task = Task.new
    @task.deadline ||= 1.week.from_now
  end

  def create
    @task = Task.new(task_params)
    category_ids = params[:task][:category_ids].reject(&:blank?)
    @task.category_ids = category_ids
    if @task.save
      redirect_to @task, notice: "作成しました"
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Taskを更新しました"
    else
      render :edit, status: 422
    end
  end

  def destroy
    @task.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :priority, :status, category_ids: [], category_names: [])  
  end
  
end
