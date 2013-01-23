class AddPriceToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :price, :string
  end
end
