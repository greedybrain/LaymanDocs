class CreateLaymen < ActiveRecord::Migration[6.0]
  def change
    create_table :laymen do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :bio

      t.timestamps
    end
  end
end
