class RemoveCountFromUpvotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :upvotes, :count, :integer
  end
end
