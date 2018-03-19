class BooksController < ApplicationController

  def index
  end

  def search
    # @books = Book.ransack(title_cont: params[:q], author_cont: params[:q], content_cont: params[:q], m: 'or').result(distinct: true).limit(5)
    @books = Book.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
    @author = Book.ransack(author_cont: params[:q]).result(distinct: true).limit(5)
    @content = Book.ransack(content_cont: params[:q]).result(distinct: true).limit(5)

    # Separate search from autocomplete.

    respond_to do |format|
      format.html {}
      format.json {
        @books = @books.limit(5)
        @author = @author.limit(5)
        @content = @content.limit(5)
      }
    end
  end

  def show
    @book = Book.find(params[:id])
  end

end


