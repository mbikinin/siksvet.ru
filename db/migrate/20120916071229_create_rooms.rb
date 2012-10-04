class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.integer :objects_id
      t.integer :plan_id
      t.integer :number_room
      t.integer :count_rooms
      t.string :area_all
      t.string :area_living_room
      t.string :area_kitchen
      t.string :area_room_1
      t.string :area_room_2
      t.string :area_room_3
      t.string :area_room_4
      t.string :area_wc_room
      t.string :area_bathroom_room
      t.string :area_loggia
      t.text :description      
      t.string :img
      t.boolean :is_active
      t.timestamps
    end
  end
end
