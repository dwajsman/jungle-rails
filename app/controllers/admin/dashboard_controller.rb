class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USER_AUTH'], password: ENV['PASS_AUTH']


  def show
  end
end
