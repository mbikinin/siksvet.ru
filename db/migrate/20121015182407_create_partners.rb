class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :title
      t.string :img_file_name
      t.text :description
      t.text :contacts
      t.boolean :on_main, :default => 1
      t.boolean :is_active, :default => 1
      t.timestamps
    end
  end
end
