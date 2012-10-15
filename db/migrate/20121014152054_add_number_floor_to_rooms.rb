class AddNumberFloorToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :number_floor, :integer

  end
end
