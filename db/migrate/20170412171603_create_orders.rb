class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :bid, foreign_key: true
      t.references :product, foreign_key: true
      t.datetime :order_date

      t.timestamps
    end
  end
end
