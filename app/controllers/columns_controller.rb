class ColumnsController < ApplicationController
  load_and_authorize_resource
  
  
  def new
  end

  def create
  end

  def show
  end

  def index
    @columns = Column.all.order(publication_timestamp: :desc)
  end

  private

end
