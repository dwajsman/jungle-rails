class Admin::CategoriesController < ApplicationController


    http_basic_authenticate_with name: ENV['USER_AUTH'], password: ENV['PASS_AUTH']

    def index
      @categories = Category.order(id: :desc).all
      # @categories = 'Hello'

    end

    def new
    end

    def create
    end



end
