class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @book.user_id = current_user.id
    @user = current_user
    
  end

  def show
   @book = Book.find(params[:id]) 
   @books = Book.all
   @user = @book.user
    
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book), notice: 'you have created book successfully.'
    else
    @books = Book.all
    @user = current_user
    render :index
    
  
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: 'you have update book successfully.'
    else
    render :edit
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    render :edit
    else
    redirect_to books_path
    end
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
