class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :lang

      t.timestamps null: false
    end
  end
end
