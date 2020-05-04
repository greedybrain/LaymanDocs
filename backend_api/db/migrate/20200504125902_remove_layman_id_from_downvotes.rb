class RemoveLaymanIdFromDownvotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :downvotes, :layman_id
  end
end
