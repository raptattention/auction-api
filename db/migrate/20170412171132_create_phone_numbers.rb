class CreatePhoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_numbers do |t|
      t.references :user, foreign_key: true
      t.references :area_code, foreign_key: true
      t.integer :phone_number

      t.timestamps
    end
  end
end
