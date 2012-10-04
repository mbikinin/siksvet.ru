class AddLinkToEquipmentCategory < ActiveRecord::Migration
  def change
    add_column :equipment_categories, :link, :string

  end
end
