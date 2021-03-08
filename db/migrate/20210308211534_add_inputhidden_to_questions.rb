class AddInputhiddenToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :input_hidden, :boolean, default: false
  end
end
