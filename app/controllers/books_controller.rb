class BooksController < ApplicationController
  before_action :find_book, only:[:show, :edit, :update, :destroy]
  
  def index
    @books = Book.all.order("created_at DESC")
    authorize @books
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, :notice => "Added"
    else
      render 'new'
    end
  end

  def show
   
  end
  
  def edit

  end

  def update
    if @book.update(book_params)
      flash[:notice]="Updated Successfully"
      redirect_to @book
    else
      render 'edit'
    end
  end
  
  def destroy
    @book.destroy
    redirect_to root_path
  end

  private
  
  def find_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def book_params
    params.require(:book).permit(:name, :author)
  end
end
