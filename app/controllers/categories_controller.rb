class CategoriesController < ApplicationController
  def index
    render locals: {
      categories: Category.all
    }
  end
end
