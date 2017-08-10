class UsersController < ApplicationController

  include SessionsHelper


  # Require login to edit user info
  before_action :logged_in_user, only: [:show, :edit, :update]


  def index
  end

  def new
  end

  def create
    if params[:password_confirmation] == params[:user][:password]
      @user = User.new(user_params)
      if @user.save
        session[:id] = @user.id
        # redirect_to sessions_url(action: new)
        redirect_to '/'

      else
        @errors = @user.errors.full_messages
        render 'new'
      end
    else
      @errors = ['Passwords do not match!']
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :user_name)
  end




end
