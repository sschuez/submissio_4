class AnswersController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@answer = Answer.new(answer_params)# || Answer.all.find_by(question: @question)
		@answer.question = @question

	  if @answer.save
	    @next_question = @answer.question.next_question
	    if @next_question == nil
	    	redirect_to questions_path
	    else
	    	redirect_to question_path(@next_question)
	    end
	  else
	    render 'questions/show'
	  end
	end

	private

	def answer_params
		params.require(:answer).permit(:content)
	end
end
