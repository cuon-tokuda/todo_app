class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update destroy]
  
    def index
      @categories = Category.all
      @q = Category.ransack(params[:q])
      @categories = @q.result
    end
  
    def show
    end
  
    def new
      @category = Category.new
    end
  
    def edit
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        redirect_to @category, notice: '作成しました'
      else
        render :new
      end
    end
  
    def update
      if @category.update(category_params)
        redirect_to @category, notice: 'Taskを更新しました'
      else
        render :edit
      end
    end
  
    def destroy
      @category.destroy
      redirect_to categories_path, notice: '削除しました'
    end
  
    private
  
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:name)
    end
end
