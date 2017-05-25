class IssuesController < ApplicationController

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
      redirect_to "new"
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
