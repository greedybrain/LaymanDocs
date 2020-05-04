class AddLaymanIdToDownvotes < ActiveRecord::Migration[6.0]
  def change
    add_column :downvotes, :layman_id, :integer
  end
end
