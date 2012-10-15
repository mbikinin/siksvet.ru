class AddObjectsIdToDeclarations < ActiveRecord::Migration
  def change
    add_column :declarations, :objects_id, :integer

  end
end
