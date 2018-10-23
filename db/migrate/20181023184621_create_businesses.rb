class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.integer :branch
      t.integer :service_number
      t.integer :sellers_code
      t.string :service_name
      t.integer :client_code
      t.string :client_name
      t.integer :product_code
      t.string :product_description
      t.string :payment_terms
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
