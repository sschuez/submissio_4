class AnswersController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@submissio = Submissio.find(params[:submissio_id])
		@answer = Answer.new(answer_params)# || Answer.all.find_by(question: @question)
		@answer.question = @question
		@answer.submissio = @submissio

	  if @answer.save
	    @next_question = @answer.question.next_question
	    if @next_question == nil
	    	redirect_to submissio_questions_path(@submissio)
	    else
	    	redirect_to submissio_question_path(@submissio, @next_question)
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
