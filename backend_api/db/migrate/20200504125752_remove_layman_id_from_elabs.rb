class RemoveLaymanIdFromElabs < ActiveRecord::Migration[6.0]
  def change
    remove_column :elabs, :layman_id
  end
end
