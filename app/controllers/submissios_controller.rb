class SubmissiosController < ApplicationController
  def index
  	@submissios = Submissio.all
  end

  def show
  	@submissio = Submissio.find(params[:id])
  end

  private

  def submissio_params
 		 	
  end
end
