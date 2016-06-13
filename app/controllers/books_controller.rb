class BooksController < ApplicationController
  def index
    @books = Book.order(params[:sort])
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(params.require(:book).permit(:name, :author, :genre, :rating))

    if @book.save
    redirect_to @book
  else
    render 'new'
  end
  end
  def edit
    @book = Book.find(params[:id])
  end
  def show
    @book = Book.find(params[:id])
  end
  def delete
  end
  def similar
    @book = Book.find(params[:id])
    @books = Book.all
  end
end
