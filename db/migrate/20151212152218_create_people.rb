# CreateMembers
class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name,      null: false
      t.integer :age,      null: false
      t.string :mail

      t.timestamps null: false
    end

    add_index :people, :mail, unique: true
  end
end
