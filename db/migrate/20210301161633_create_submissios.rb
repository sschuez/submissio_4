class CreateSubmissios < ActiveRecord::Migration[6.1]
  def change
    create_table :submissios do |t|
      t.string :description_short
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
