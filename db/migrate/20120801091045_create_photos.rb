class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :objects_id
      t.string :img_file_name
      t.integer :carma, :default=>0
      t.integer :views, :default=>0
      
      t.timestamps
    end
  end
end
