class Api::V1::CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]

    PER_PAGE = 5

    def index
        @categories = Category.all
        @categories = @categories.where("name LIKE ?", "%#{params[:name]}%") if params[:name].present?
        @categories = @categories.page(params[:page]).per(PER_PAGE)

        render json: @categories
    end

    def show
        render json: @category
    end

    def create
        @category = Category.new(category_params)

        if @category.save
        render json: @category, status: :created
        else
        render json: @category.errors, status: :unprocessable_entity
        end
    end

    def update
        if @category.update(category_params)
        render json: @category
        else
        render json: @category.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @category.destroy
        head :no_content
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
