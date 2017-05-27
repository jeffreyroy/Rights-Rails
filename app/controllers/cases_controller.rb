class CasesController < ApplicationController

  # Skip CSRF protection
  skip_before_filter  :verify_authenticity_token

  def index
  end

  def new
    @issue = Issue.find(params[:issue_id])
    @case = Case.new
    if request.xhr?
      render partial: 'form'
    else
      render 'new'
    end
  end

  def create
    @issue = Issue.find(params[:issue_id])
    # Get parameters
    p = params[:plaintiff]
    d = params[:defendant]
    vol = params[:volume]
    pg = params[:page]
    # Construct case info from parameters, if they exist
    name = (p != "" && d != "") ? p + ' v. ' + d : nil
    citation = (vol != 0 && pg != 0) ? vol.to_s + params[:reporter] + pg.to_s : nil
    date = params[:date]
    @case = Case.new(issue_id: @issue.id, name: name, cite1: citation, date_decided: date)
    if @case.save
      if request.xhr?
        render partial: "button", layout: false, locals: { cur_case: @case }
      else
        # redirect_to "/issues/#{@issue.id}"
        redirect_to issue_url(@issue)
      end
    else
      if !request.xhr?
        @issues=Issue.all
        render "new"
      end
    end
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
      render "issues/show"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
