class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def new
  end


  def edit
  end

  def create
      book = Book.new(book_params)
    book.save
    redirect_to blogs_path
  end

   private
  def book_params
    params.require(:list).permit(:title, :body)
  end

end
