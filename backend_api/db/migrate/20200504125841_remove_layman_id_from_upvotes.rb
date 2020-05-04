class RemoveLaymanIdFromUpvotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :upvotes, :layman_id
  end
end
