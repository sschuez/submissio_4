class AddModerationToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :moderation, :text, default: ""
  end
end
