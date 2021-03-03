class Question < ApplicationRecord
	has_many :answers

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
end
