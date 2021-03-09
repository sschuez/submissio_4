class AddColumnsToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :input_hidden, :boolean, default: false
    add_column :questions, :title, :string
    add_column :questions, :moderation, :text
    add_column :questions, :hint, :text
    add_column :questions, :identifier, :string
  end
end
