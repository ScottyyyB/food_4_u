class CreateMenu < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.belongs_to :restaurant, foreign_key: true
    end
  end
end
