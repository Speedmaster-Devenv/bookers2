class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def edit
    if params[:id].to_i != current_user.id
      redirect_to books_path
      return
    end
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = %q[You've updated user successfully.]
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
