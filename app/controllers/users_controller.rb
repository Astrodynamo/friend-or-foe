class UsersController < ApplicationController
  # GET '/users'
  def new
    @user = User.new
  end #refactor view for select or create business

  # POST '/users'
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/users/new'
    end
  end

  # GET '/users/:id'
  def show
    redirect_to login_path if !logged_in? || current_user.id.to_s != params[:id]
  end #refactor logic out of view

  # GET '/login'
  def login
    redirect_to user_path(current_user) if logged_in?
  end

  # POST '/login'
  def verify_login
    @user = User.find_by(id: params[:user][:id])
    render '/login' unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  # GET '/logout'
  def logout
    session.clear if current_user
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :business_id)
  end
end
