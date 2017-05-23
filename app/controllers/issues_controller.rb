class IssuesController < ApplicationController

  def index
  end

  def new
  end

  def create
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
