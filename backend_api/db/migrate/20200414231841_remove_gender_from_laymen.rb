class RemoveGenderFromLaymen < ActiveRecord::Migration[6.0]
  def change
    remove_column :laymen, :gender, :string
  end
end
