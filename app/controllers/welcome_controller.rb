class WelcomeController < ApplicationController
  #before_filter :valid_author_name_length?, only: [:check_status]

  def index
  end

  def status
  end

  def check_status
    @author = params[:author]
    @manuscript = Manuscript.find_by_code(params[:code])
    if @manuscript && @manuscript.author_match?(@author)
      render :results
    else
      flash.now[:notice] = "No match"
      render :status
    end
  end
end
