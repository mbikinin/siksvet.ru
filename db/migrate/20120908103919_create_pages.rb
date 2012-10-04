class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, :limit => 255
      t.string :uri, :limit => 50
      t.string :description, :limit => 500
      t.text :text
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
