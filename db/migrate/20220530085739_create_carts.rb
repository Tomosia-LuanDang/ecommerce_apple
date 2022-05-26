class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.float :total_price_of_cart
      t.float :price_after_taxes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
