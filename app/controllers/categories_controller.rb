class CategoriesController < ApplicationController
  def show
  	@category = Category.friendly.find(params[:id])
  	@advertisments = @category.advertisments.active.page(params[:page]).per(5)
  end
end
