class SubmissiosController < ApplicationController
  def index
  	@submissios = Submissio.all
    @submissio = Submissio.new
  end

  def show
    @submissio = Submissio.find(params[:id])
  end

  def create
    @submissio = Submissio.new(submissio_params)
    @submissio.user = current_user
    if @submissio.save
      flash[:success] = "Submissio successfully created"
      redirect_to submissios_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def submissio_params
    params.require(:submissio).permit(:description_short)        
  end
end
