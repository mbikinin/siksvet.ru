class CreateMainMenus < ActiveRecord::Migration
  def change
    create_table :main_menus do |t|
      t.string :title
      t.string :sort
      t.boolean :on_main, :default => 1
      t.timestamps
    end
  end
end
