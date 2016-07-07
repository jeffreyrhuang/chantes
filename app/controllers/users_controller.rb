class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = 'User profile updated'
      redirect_to user_path(@user)
    else
      render 'show'
    end

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end 

end
