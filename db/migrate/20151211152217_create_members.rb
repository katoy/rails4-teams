# CreateMembers
class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name,      null: false
      t.integer :age,      null: false
      t.string :mail

      t.string :target_type
      t.integer :target_id

      t.references :team
      t.timestamps null: false
    end
    add_index :members, [:team_id, :created_at]
    add_index :members, :mail, unique: true
    add_index :members, [:target_id, :target_type]
  end
end
