class CasesController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
    @case = Case.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
