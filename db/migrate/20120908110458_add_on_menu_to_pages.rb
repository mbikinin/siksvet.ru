class AddOnMenuToPages < ActiveRecord::Migration
  def change
    add_column :pages, :on_menu, :boolean, :default => true

  end
end
