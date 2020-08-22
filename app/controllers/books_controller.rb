class BooksController < ApplicationController
before_action :authenticate_user!
before_action :check_user, only: [:edit, :update, :destroy]
  def show
    @user = User.find(current_user.id)
    @book2 = Book.new
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @user2 =@book.user
    @comments = @book.book_comments
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
      @book =Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def check_user
        book=Book.find(params[:id])
        @user=book.user
        if current_user.id !=@user.id
        redirect_to books_path
  end
  end
end
