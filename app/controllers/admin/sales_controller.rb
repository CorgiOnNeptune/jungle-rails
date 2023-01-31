class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_USER'], password: ENV['HTTP_AUTH_PASS']

  def index
    @sales = Sale.all.order(ends_on: :desc)
  end
end
