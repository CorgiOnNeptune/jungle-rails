class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_USER'], password: ENV['HTTP_AUTH_PASS']

  def show
    @products = Product.count
    @categories = Product.distinct.pluck(:category_id).count
  end
end
