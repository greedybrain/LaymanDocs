class DropLaymenTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :laymen
  end
end
