class CategoriesController < ApplicationController
  def show
  	@category = Category.friendly.find(params[:id])
  	@advertisments = @category.advertisments.all().page(params[:page]).per(5)
  end
end
