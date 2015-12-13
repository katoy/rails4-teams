# CreateTeams
class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.text :description
      t.timestamps null: false
    end
    add_index :teams, [:name, :created_at], unique: true
  end
end
