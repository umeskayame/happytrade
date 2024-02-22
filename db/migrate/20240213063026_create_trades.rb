class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.references :user,               null: false, foreign_key: true
      t.references :item,               null: false, foreign_key: true
      t.references :buyer_user,         null: false, foreign_key: { to_table: :users }
      t.references :buyer_item,         null: false, foreign_key: { to_table: :items }
      t.timestamps
    end
  end
end
