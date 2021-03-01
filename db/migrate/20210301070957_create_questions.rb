class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :type
      t.integer :order

      t.timestamps
    end
  end
end
