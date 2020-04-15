class AddLaymanIdToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :layman_id, :bigint
  end
end
