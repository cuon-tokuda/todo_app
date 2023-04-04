class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update destroy]

    PER_PAGE = 5
  
    def index
      @categories = Category.all
      @categories = @categories.where("name LIKE ?", "%#{params[:name]}%") if params[:name].present?
      @categories = @categories.page(params[:page]).per(PER_PAGE)
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
      redirect_to categories_url, notice: '削除しました'
    end
  
    private
  
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:name)
    end
end
  