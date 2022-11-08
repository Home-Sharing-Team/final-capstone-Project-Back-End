class CreatePropertyImagesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :property_images do |t|
      t.string :source, null: false
      
      t.references :property, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
