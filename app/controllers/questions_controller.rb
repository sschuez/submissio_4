class QuestionsController < ApplicationController
  def index
  	@questions = Question.order(:order)
  	@question = Question.new
  	# @submissio = Submissio.find(params[:submissio_id])
  end

  def show
  	@question = Question.find(params[:id])
  	@submissio = Submissio.find(params[:submissio_id])
  	@answer = @submissio.answers.find_by(question: @question).nil? ? Answer.new : @submissio.answers.find_by(question: @question) 
  	@previous_question = @question.previous_question
  end

  def create
  	@question = Question.new(question_params)
  	if @question.save
  		redirect_to questions_path
  		flash[:notice] = "Created new question: #{@question.content}"
  	else
  		render :new
  	end
  end

  private

  def question_params
  	params.require(:question).permit(:content, :order, :question_type, answers_attributes: [ :content ])
  end
end
