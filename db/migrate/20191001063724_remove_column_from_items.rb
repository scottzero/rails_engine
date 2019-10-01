class RemoveColumnFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :merchants_id, :bigint
  end
end
