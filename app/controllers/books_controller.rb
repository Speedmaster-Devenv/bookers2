class BooksController < ApplicationController
  def index
    @books = Book.all
    Rails.logger.info "$$$$$$$$$$book_path=>#{book_path(1)}"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to books_path
    else
      flash[:alert] = @book.errors.full_messages
      @books = Book.all
      @book = Book.new(book_params)
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
