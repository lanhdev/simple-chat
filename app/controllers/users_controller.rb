class UsersController < ApplicationController
  before_action :require_signin, only: [:index]

  def index
    @friends_id = current_user.friends.all.select(:id)
    @users = User.where.not(id: @friends_id).where.not(id: current_user.id)  # remain users who are not friend with current user
  end

  def new
    @user = User.new(email: params[:email])
  end

  def show
    @users = current_user.friends # Friendships of current user
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome! #{@user.name}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
