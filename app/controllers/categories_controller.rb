class CategoriesController < ApplicationController
  def index
    @categories = Rails.cache.fetch("all_categories", expires_in: 1.hour) do 
      Category.includes(:articles).all
    end
    @row_count = 4
  end
end
