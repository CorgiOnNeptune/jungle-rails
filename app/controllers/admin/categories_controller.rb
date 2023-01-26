class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_USER'], password: ENV['HTTP_AUTH_PASS']

  def index
    @categories = Category.order(id: desc).all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to %i[admin categories], notice: 'Product created!'
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
