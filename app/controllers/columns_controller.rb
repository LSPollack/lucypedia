class ColumnsController < ApplicationController
  load_and_authorize_resource
  before_action :set_primary_categories, only: [:edit, :update]


  def index
    # if there is a primary category in the params hash then run this query to filter by the columns with that category.
    if params[:primary_category_id]
      @columns = Column.where(primary_category_id: params[:primary_category_id]).order(publication_timestamp: :desc)
    else
      @columns = Column.all.order(publication_timestamp: :desc)
    end

    render @columns, layout: false if request.xhr?
  end

  def update
    @column.update(column_params)
    redirect_to(columns_path)
  end

  private
    def column_params
      params.require(:column).permit(:primary_category_id, {category_ids: [] })
    end

    def set_primary_categories
      @primary_categories = Category.where(is_primary: true)
    end
end
