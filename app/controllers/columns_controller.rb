class ColumnsController < ApplicationController
  load_and_authorize_resource
  before_action :set_primary_categories, only: [:edit, :update]


  def index
    @columns = Column.all.order(publication_timestamp: :desc)
  end

  def update
    @column.update(column_params)
    redirect_to(column_path)
  end

  private
    def column_params
      params.require(:column).permit(:primary_category_id, {category_ids: [] })
    end

    def set_primary_categories
      @primary_categories = Category.where(is_primary: true)
    end
end
