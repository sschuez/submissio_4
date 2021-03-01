class QuestionsController < ApplicationController
  def index
  	@questions = Question.all
  	@submissio = Submissio.find(params[:submissio_id])
  end

  def show
  	@question = Question.find(params[:id])
  	@submissio = Submissio.find(params[:submissio_id])
  	@answer = Answer.new
  	@previous_question = @question.previous_question
  end

  private

  def question_params
  	params.require(:question).permit(:content, answers_attributes: [ :content ])
  end
end
