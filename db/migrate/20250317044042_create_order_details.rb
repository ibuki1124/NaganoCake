class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false, default: 0

      t.timestamps
    end
    add_foreign_key :order_details, :orders
    add_foreign_key :order_details, :items
  end
end
