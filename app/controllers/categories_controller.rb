class CategoriesController < ApplicationController
  def index
    render locals: {
      categories: Category.active
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

  def destroy
    category = Category.find(params[:id])

    category.update(deleted_at: Time.current)

    render json: { category: category }
  end

  private

  def category_params
    params.require(:category).permit(:name, :budget)
  end
end
