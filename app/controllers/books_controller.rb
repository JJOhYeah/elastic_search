class BooksController < ApplicationController

  def index
  end

  def search
    # This searches across all columns for words "q" entered into the seach bar.
    @books = Book.ransack(title_cont: params[:q], author_cont: params[:q], content_cont: params[:q], m: 'or').result(distinct: true).limit(5)

    # Separate search from autocomplete.

    respond_to do |format|
      format.html {}
      format.json {
        @books = @books.limit(5)
      }
    end
  end

  def show
    @book = Book.find(params[:id])
  end

end


