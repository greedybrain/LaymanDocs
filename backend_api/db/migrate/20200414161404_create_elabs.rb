class CreateElabs < ActiveRecord::Migration[6.0]
  def change
    create_table :elabs do |t|
      t.text :elaboration
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :layman, null: false, foreign_key: true

      t.timestamps
    end
  end
end
