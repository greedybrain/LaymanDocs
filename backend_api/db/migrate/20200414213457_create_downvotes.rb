class CreateDownvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :downvotes do |t|
      t.integer :count
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :layman, null: false, foreign_key: true
      t.belongs_to :elab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
