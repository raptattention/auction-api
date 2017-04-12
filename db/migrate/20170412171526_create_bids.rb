class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.datetime :bidding_date
      t.decimal :price

      t.timestamps
    end
  end
end
