class RemoveCountFromDownvotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :downvotes, :count
  end
end
