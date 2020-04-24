class RemoveBioFromLaymen < ActiveRecord::Migration[6.0]
  def change
    remove_column :laymen, :bio, :text
  end
end
