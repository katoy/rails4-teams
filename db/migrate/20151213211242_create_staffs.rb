class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :skill

      t.timestamps null: false
    end
  end
end
