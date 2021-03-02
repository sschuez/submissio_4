class AnswersController < ApplicationController
	before_action :set_question_answer, only: [ :create, :update ]
	
	def create
	  if @answer.save
	    final_question?
	  else
	    render 'questions/show'
	  end
	end

	def update
	  if @answer.save
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
			redirect_to submissio_questions_path(@submissio)
		end
	end

	def set_question_answer
		@question = Question.find(params[:question_id])
		@submissio = Submissio.find(params[:submissio_id])
		@answer = Answer.new(answer_params)# || Answer.all.find_by(question: @question)
		@answer.question = @question
		@answer.submissio = @submissio
	end

	def answer_params
		params.require(:answer).permit(:content)
	end
end
