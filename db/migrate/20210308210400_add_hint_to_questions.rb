class AddHintToQuestions < ActiveRecord::Migration[6.1]
  def change
  	add_column :questions, :hint, :text, default: ""
  end
end
