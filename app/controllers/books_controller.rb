class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to show_path(@book.id), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  def create
    book = Book.new(book_params)
   if book.save
     redirect_to show_path(book.id), notice: 'Book was successfully created.'
   else
    @books = Book.all
    @book = book
     render :index
   end
  end

  private
   def book_params
    params.require(:book).permit(:title, :body)
   end
end