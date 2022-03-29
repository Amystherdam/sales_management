class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.integer :metier
      t.integer :service_number
      t.integer :seller_code
      t.string :seller_name
      t.integer :client_code
      t.string :client_name
      t.integer :product_code
      t.string :product_description
      t.string :payment_type
      t.integer :request_number
      t.integer :product_quantity
      t.float :product_value
      t.float :product_discount
      t.float :amount
      t.string :business_situation
      t.date :date_service
      t.date :date_transmission_note

      t.timestamps
    end
  end
end
