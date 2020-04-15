class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.text :reply
      t.belongs_to :elab, foreign_key: true

      t.timestamps
    end
  end
end
