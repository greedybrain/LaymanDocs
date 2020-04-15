class RemoveNullFalseFromIdsInDownvotes < ActiveRecord::Migration[6.0]
  def change
    change_column :downvotes, :layman_id, :integer, :null => true
    change_column :downvotes, :question_id, :integer, :null => true
    change_column :downvotes, :elab_id, :integer, :null => true
  end
end
