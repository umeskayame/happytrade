class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :trade,              null: false, foreign_key: true
      t.string :postcode,               null: false
      t.integer :prefecture_id,         null: false
      t.string :city,                   null: false
      t.string :house_number,           null: false
      t.string :building
      t.string :phone,                  null: false
      t.timestamps
    end
  end
end
