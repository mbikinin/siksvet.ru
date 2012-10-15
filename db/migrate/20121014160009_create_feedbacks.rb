class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :text
      t.string :comment
      t.string :section 
      t.timestamps
    end
  end
end
