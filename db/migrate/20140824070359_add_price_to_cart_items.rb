class AddPriceToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :price, :decimal, precision: 4, scale: 2
  end
end
