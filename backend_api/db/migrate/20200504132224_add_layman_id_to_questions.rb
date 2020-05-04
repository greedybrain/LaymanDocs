class AddLaymanIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :layman_id, :integer
  end
end
