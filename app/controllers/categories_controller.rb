class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:articles).all
    @row_count = 4
  end
end
