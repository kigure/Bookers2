class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
  end

  def edit
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    # @book.score = Language.get_data(book_params[:body])
    @book.user_id = current_user.id

    if @book.save
    flash[:book_create] = 'You have created book successfully.'
    redirect_to book_path(@book)
    else
    render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:update] = 'You have updated book successfully.'
    redirect_to book_path(@book)
    else
    render :edit
    end
  end


   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
