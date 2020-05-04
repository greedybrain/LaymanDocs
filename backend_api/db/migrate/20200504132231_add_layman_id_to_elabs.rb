class AddLaymanIdToElabs < ActiveRecord::Migration[6.0]
  def change
    add_column :elabs, :layman_id, :integer
  end
end
