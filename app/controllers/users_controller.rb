class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/users/new'
    end
  end

  def show
    current_user
  end

  def login
    redirect_to user_path(current_user) if logged_in?
  end

  def verify_login
    @user = User.find_by(id: params[:user][:id])
    render '/login' unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :business_id)
  end
end
