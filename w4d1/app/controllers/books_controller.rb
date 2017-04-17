class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_url
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
