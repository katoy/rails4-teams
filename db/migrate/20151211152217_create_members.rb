# Seed
class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name,      null: false
      t.integer :age,      null: false
      t.string :mail
      t.references :team
      t.timestamps null: false
    end
  end
end
