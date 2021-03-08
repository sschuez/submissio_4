class QuestionsController < ApplicationController
  before_action :set_question, only: [ :show, :edit, :update ]

  def index
  	@questions = Question.order(:order)
  	@question = Question.new
  	# @submissio = Submissio.find(params[:submissio_id])
  end

  def show
    @submissio = Submissio.find(params[:submissio_id])
  	@answer = @submissio.answers.find_by(question: @question).nil? ? Answer.new : @submissio.answers.find_by(question: @question) 
  	@previous_question = @question.previous_question
  end

  def create
  	@question = Question.new(question_params)
  	if @question.save
  		redirect_to questions_path(anchor: "question-#{@question.id}")
  		flash[:notice] = "Created new question: #{@question.content}"
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path(anchor: "question-#{@question.id}")
      flash[:notice] = "Question #{@question.content} has been updated"
    else
      render :edit
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
  	params.require(:question).permit(:content, :order, :question_type, :hint, :title, :moderation, :identifier, :input_hidden, answers_attributes: [ :content ])
  end
end
