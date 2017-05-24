class CasesController < ApplicationController

  # Skip CSRF protection
  skip_before_filter  :verify_authenticity_token

  def index
  end

  def new
  end

  def create
  end

  def show
    @case = Case.find(params[:id])
  end


  def show_citation
    @issue = Issue.find(params[:issue_id])
    @citation = CLOpinion.new(id: params[:id])
    @citation.init_from_id
  end

  def citations
    @issue = Issue.find(params[:issue_id])
    @case = Case.find(params[:case_id])
    if request.xhr?
      render partial: "citing_case", layout: false, locals: { cur_case: @case, issue: @issue }
    else
      redirect_to :'issues/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
