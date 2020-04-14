class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :topic
      t.string :url
      t.text :pasted_info
      t.integer :layman_id

      t.timestamps
    end
  end
end
