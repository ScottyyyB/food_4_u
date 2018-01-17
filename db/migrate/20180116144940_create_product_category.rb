class CreateProductCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.belongs_to :menu, foreign_key: true

      t.timestamps
    end
  end
end
