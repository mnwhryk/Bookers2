class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    # @books = Book.all
    @books = Book.page(params[:page]).reverse_order
  end

  def show
  end

  def destroy
  end

  private
  def book_params
    prams.require(:book).permit(:title, :opinion)
  end

end
