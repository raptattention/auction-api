class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :original_price
      t.integer :qauntity

      t.timestamps
    end
  end
end
