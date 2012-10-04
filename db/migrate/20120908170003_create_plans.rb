class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.integer :objects_id
      t.text :description
      t.integer :floor
      t.string :img_file_name
      t.boolean :is_active

      t.timestamps
    end
  end
end
