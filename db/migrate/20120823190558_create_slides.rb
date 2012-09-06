class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.string :icon
      t.text :text
      t.string :img
      t.string :href

      t.timestamps
    end
  end
end
