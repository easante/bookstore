class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :cart, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
