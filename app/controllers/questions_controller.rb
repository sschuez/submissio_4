class QuestionsController < ApplicationController
  def index
  	@questions = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  	@answer = Answer.new
  	@previous_question = @question.previous_question
  end

  # def update
  # 	@question = Question.find(params[:id])
  # 	@question.update(question_params)
  # 	# render 'answers/update'
  # 	# redirect_to url_for(:controller => :answers, :action => :post)
  # end

  private

  def question_params
  	params.require(:question).permit(:content, answers_attributes: [ :content ])
  end
end
