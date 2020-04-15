class RemoveNullFalseFromIdsInUpvotes < ActiveRecord::Migration[6.0]
  def change
    change_column :upvotes, :layman_id, :integer, :null => true
    change_column :upvotes, :question_id, :integer, :null => true
    change_column :upvotes, :elab_id, :integer, :null => true
  end
end
