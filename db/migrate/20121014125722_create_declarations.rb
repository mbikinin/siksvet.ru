class CreateDeclarations < ActiveRecord::Migration
  def change
    create_table :declarations do |t|
      t.string :title
      t.text :anounce
      t.text :text
      t.string :img_file_name
      t.string :file
      t.boolean :is_active
      
      t.timestamps
    end
  end
end
