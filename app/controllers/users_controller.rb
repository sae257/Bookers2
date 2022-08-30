class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
    
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id),notice: 'You have updated user successfully.'
    else
    render :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
   
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:introduction, :name, :profile_image)
  end
end
