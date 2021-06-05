class UsersController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = %q[You've updated user successfully.]
      redirect_to books_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :note)
  end
end
