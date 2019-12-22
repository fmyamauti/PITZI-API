class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :device_model
      t.string :imei
      t.decimal :annual_price
      t.integer :installment_no
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
