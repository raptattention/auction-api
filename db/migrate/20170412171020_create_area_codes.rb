class CreateAreaCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :area_codes do |t|
      t.string :country
      t.integer :area_code

      t.timestamps
    end
  end
end
