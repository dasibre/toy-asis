class WelcomeController < ApplicationController
  def index
  end

  def status
  end

  def check_status
  	@manuscript = find_manuscript(params[:code])
    if @manuscript
  	   @authors = @manuscript.authors
     else
      flash[:notice] = "Manuscript not found"
      render :status
    end
  end


  private

  def find_manuscript(code)
  	@manuscript = Manuscript.find_by_code(code)
  end
end
