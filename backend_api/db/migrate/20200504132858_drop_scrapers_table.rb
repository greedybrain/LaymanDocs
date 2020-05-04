class DropScrapersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :scrapers
  end
end
