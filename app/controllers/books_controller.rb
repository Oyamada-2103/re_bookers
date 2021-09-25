class BooksController < ApplicationController
  def index
    @books = Book.all
    # new部分
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)

    @books = Book.all
    # エラーメッセージを出すときのrender部分で使う

    if @book.save
      redirect_to book_path(@book.id), notice:'Book was successfully created.'
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @books = Book.all
    @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book.id), notice:'Book was successfully updated.'
      else
        render "edit"
      end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path , notice:'Book was successfully destroyed.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
