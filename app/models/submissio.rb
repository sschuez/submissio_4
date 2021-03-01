class Submissio < ApplicationRecord
  belongs_to :user
  has_many :answers
end
