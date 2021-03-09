class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	validates :order, presence: true
	validates :order, uniqueness: true
	# validates :identifier, uniqueness: true
	has_rich_text :moderation

	def next_question
	  Question.where(order: self.order + 1).first
	end

	def previous_question
	  Question.where(order: self.order - 1).first
	end

	def question_type?
		case self.question_type
		when "text" 
			:text
		when "integer"
			:integer
		when "boolean"
			:boolean
		when "radio_buttons"
			:radio_buttons
		when "check_boxes"
			:check_boxes
		when "select"
			:select
		when "file"
			:file
		when "date"
			:date
		when "password"
			:password
		else
			:string 
		end
	end

	QUESTION_TYPES = [ "string", "text", "integer", "boolean", "radio_buttons", "check_boxes", "select",	"file", "date", "password" ]
end
