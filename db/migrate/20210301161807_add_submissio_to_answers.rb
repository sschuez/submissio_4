class AddSubmissioToAnswers < ActiveRecord::Migration[6.1]
  def change
  	add_reference :answers, :submissio, index: true
  end
end
