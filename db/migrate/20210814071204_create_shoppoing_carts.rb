class CreateShoppoingCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppoing_carts do |t|
      t.boolean :buy_flag, null: false, default: false
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
