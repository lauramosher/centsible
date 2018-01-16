class CategoriesController < ApplicationController
  def index
    render locals: {
      categories: Category.all
    }
  end

  def create
    category = Category.create(category_params)

    if category.persisted?
      render json: { category: category }
    else
      render status: 400, json: { messages: category.errors.messages }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :budget)
  end
end
