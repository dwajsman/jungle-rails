class Admin::CategoriesController < ApplicationController


    http_basic_authenticate_with name: ENV['USER_AUTH'], password: ENV['PASS_AUTH']

    def index
      @categories = Category.order(id: :desc).all
      # @categories = 'Hello'

    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to [:admin, :categories], notice: 'Category created!'
      else
        render :new
      end

    end

    private

    def category_params
      params.require(:category).permit(
        :name
      )
    end


end
