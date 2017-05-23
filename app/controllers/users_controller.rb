class UsersController < ApplicationController


  def index
  end

  def new
  end

  def create
    if params[:password_confirmation] == params[:user][:password]
      @user = User.new(user_params)
      if @user.save
        session[:id] = @user.id
        redirect_to issues_url
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
  end

  def edit
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
