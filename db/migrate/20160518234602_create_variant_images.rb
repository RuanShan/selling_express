class CreateVariantImages < ActiveRecord::Migration
  def change
    create_table :variant_images do |t|
      t.integer :variant_id

      t.attachment :image

      t.integer :image_width
      t.integer :image_height

      t.attachment :image2

      t.timestamps
    end
  end
end
