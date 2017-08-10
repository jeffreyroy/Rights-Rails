class IssuesController < ApplicationController

  include SessionsHelper

  # Skip CSRF protection
  skip_before_filter  :verify_authenticity_token

  def index
  end

  def new
    if request.xhr?
      render partial: 'form'
    else
      render 'new'
    end
  end

  def create
    # Get parameters
    @issue = Issue.new(name: params[:issue][:name])
    if @issue.save
      if request.xhr?
        render partial: "button", layout: false, locals: { issue: @issue }
      else
        redirect_to issues_url
      end
    else
      render "new"
    end
  end

  def show
    @issue = Issue.find(params[:id])
    @followed = @issue.users.include?(current_user)
  end

  def follow
    @issue = Issue.find(params[:id])
    @issue.users << current_user
    @issue.save # Need to add check for save failure
    redirect_to @issue
  end

  def unfollow
    @issue = Issue.find(params[:id])
    @issue.users.delete(current_user)
    @issue.save
    redirect_to @issue
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
