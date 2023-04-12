class Api::V1::TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    PER_PAGE = 5

    def index
      tasks = Task.order(id: :asc).where.not(status: :completed)
      q = Task.ransack(params[:q])
      tasks = q.result.where.not(status: :completed).order(id: :asc).page(params[:page]).per(PER_PAGE)
      render json: tasks
    end

    def show
      render json: @task, serializer: TaskSerializer
    end

    def create
      @task = Task.new(task_params)
      category_ids = params[:task][:category_ids].reject(&:blank?)
      @task.category_ids = category_ids
      if @task.save
        render json: @task, serializer: TaskSerializer, status: 201
      else
        render json: { errors: @task.errors.full_messages }, status: 422
      end
    end

    def update
      if @task.update(task_params)
        render json: @task, serializer: TaskSerializer
      else
        render json: { errors: @task.errors.full_messages }, status: 422
      end
    end

    def destroy
      @task.destroy!
      head :no_content
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :deadline, :priority, :status, category_ids: [], category_names: [])  
    end
end
