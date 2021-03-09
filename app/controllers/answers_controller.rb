class AnswersController < ApplicationController
	before_action :set_question_answer, only: [ :create, :update ]
	
	def create
		@answer = Answer.new(answer_params)
		@answer.question = @question
		@answer.submissio = @submissio
	  if @answer.save
	    final_question?
	  else
	    render 'questions/show'
	  end
	end

	def update
		@answer = @submissio.answers.find_by(question: @question)
	  if @answer.update(answer_params)
	    final_question?
	  else
	    render 'questions/show'
	  end
	end

	private

	def final_question?
		@next_question = @answer.question.next_question
		if @next_question
			redirect_to submissio_question_path(@submissio, @next_question)
		else
			redirect_to submissio_path(@submissio)
		end
	end

	def set_question_answer
		@question = Question.find(params[:question_id])
		@submissio = Submissio.find(params[:submissio_id])
	end

	def answer_params
		params.require(:answer).permit(:content)
	end
end
