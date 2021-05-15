class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render '/users/new'
    end
  end

  def show
    current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :business_id)
  end
end
