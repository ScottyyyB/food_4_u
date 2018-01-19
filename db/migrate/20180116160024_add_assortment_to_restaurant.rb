class AddAssortmentToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :assortment, :string
  end
end
