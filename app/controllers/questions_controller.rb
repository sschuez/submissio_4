class QuestionsController < ApplicationController
  def index
  	@questions = Question.order(:order)
  	@submissio = Submissio.find(params[:submissio_id])
  end

  def show
  	@question = Question.find(params[:id])
  	@submissio = Submissio.find(params[:submissio_id])
  	@answer = @submissio.answers.find_by(question: @question).nil? ? Answer.new : Answer.find_by(question: @question) 
  	@previous_question = @question.previous_question
  end

  private

  def question_params
  	params.require(:question).permit(:content, answers_attributes: [ :content ])
  end
end
