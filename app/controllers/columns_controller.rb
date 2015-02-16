class ColumnsController < ApplicationController
  load_and_authorize_resource

  

  def index
    @columns = Column.all.order(publication_timestamp: :desc)
  end

  def update
    @column.update(column_params)
    redirect_to(column_path)
  end

  private
    def column_params
      params.require(:column).permit({categorizer_attributes: [ :column_id, :category_id, :id, :_destroy ] })
    end
end
