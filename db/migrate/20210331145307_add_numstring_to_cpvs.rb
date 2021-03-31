class AddNumstringToCpvs < ActiveRecord::Migration[6.1]
  def change
    add_column :cpvs, :numstring, :string
  end
end
