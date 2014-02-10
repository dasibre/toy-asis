class WelcomeController < ApplicationController
  #before_filter :valid_author_name_length?, only: [:check_status]

  def index
  end

  def status
  end

  def check_status
    @author = params[:author]
    @manuscript = find_manuscript(params[:code])
    if @manuscript.author_match?(@author)
      render :results
    else
      flash[:notice] = "Author Not found"
      render :status
    end
  end

  private
  
  def find_manuscript(code)
  	@manuscript = Manuscript.find_by_code(code)
  end
end
