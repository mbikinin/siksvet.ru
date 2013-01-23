# -*- encoding : utf-8 -*-
class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title, :null => false
      t.string :uri, :null => false
      t.text :anounce, :null => false
      t.text :text, :null => false
      t.date :date, :null => false
      t.boolean :is_active, :default=> true
      t.timestamps
    end
  end
end
