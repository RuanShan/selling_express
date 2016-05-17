class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.datetime :scraped_at

      t.timestamps
    end
  end
end
