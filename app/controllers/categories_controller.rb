class CategoriesController < ApplicationController
  load_and_authorize_resource

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to(categories_path)
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to(categories_path)
  end

  def destroy
    @category.destroy
    redirect_to(categories_path)
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category_name, :is_primary, :color, :live)
    end
end
