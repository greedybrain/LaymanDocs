class RemoveReplyFromReplies < ActiveRecord::Migration[6.0]
  def change
    remove_column :replies, :reply, :text
  end
end
