# CreateMembers
class CreateJobkinds < ActiveRecord::Migration
  def change
    create_table :jobkinds do |t|
      t.string :jobkindable_type
      t.integer :jobkindable_id

      t.references :person
      t.timestamps null: false
    end

    add_index :jobkinds, [:jobkindable_id, :created_at]
    add_index :jobkinds, [:jobkindable_id, :jobkindable_type]
  end
end
