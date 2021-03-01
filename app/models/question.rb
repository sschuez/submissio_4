class Question < ApplicationRecord
	has_many :answers

	def next_question
	  Question.where(order: self.order + 1).first
	end

	def previous_question
	  Question.where(order: self.order - 1).first
	end
end
