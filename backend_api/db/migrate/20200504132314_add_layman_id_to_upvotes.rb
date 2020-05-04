class AddLaymanIdToUpvotes < ActiveRecord::Migration[6.0]
  def change
    add_column :upvotes, :layman_id, :integer
  end
end
