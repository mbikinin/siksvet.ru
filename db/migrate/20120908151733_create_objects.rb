class CreateObjects < ActiveRecord::Migration
  def change
    create_table :objects do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :floors
      t.integer :floors_int
      t.string :phone
      t.string :img_file_name
      t.string :img_floor_file_name
      t.string :date_finish
      t.string :longitude
      t.string :latitude
      t.boolean :is_active
      
      t.timestamps
    end
  end
end
