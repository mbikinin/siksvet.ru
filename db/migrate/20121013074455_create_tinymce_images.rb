class CreateTinymceImages < ActiveRecord::Migration
  def change
    create_table :tinymce_images do |t|
      t.string :file_file_name
      t.timestamps
    end
  end
end
