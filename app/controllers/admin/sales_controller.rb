class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.all.order(ends_on: :desc)
  end
end
