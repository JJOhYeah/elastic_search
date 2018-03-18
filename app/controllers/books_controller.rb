class BooksController < ApplicationController
  def index
  end

  def search
    @books = Book.ransack(params[:q]).result(distinct: true)
    
  end
end
