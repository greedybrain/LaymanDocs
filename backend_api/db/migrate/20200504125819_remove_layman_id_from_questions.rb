class RemoveLaymanIdFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :layman_id
  end
end
