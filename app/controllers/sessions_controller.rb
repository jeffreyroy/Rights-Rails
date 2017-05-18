class SessionsController < ApplicationController


  def index
  end

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.password == params[:session][:password]
      session[:id] = @user.id
      redirect_to issues_url
    else
      @errors=["No match found for email and password."]
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
end
