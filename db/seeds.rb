# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create(email: "lucas10@gmail.com", password: "123abc")

Business.create([
    {branch: 1, service_number: 5678567, seller_code: 2345234, seller_name: "Karl", client_code: 192, client_name: "Antoni", product_code: 213, product_description: "Computador Lenovo", payment_type: 
    "Boleto", request_number: 92834234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Nota Fical Emitida", date_service: "2018-10-15", date_transmission_note: "2018-10-25"},
    
    {branch: 2, service_number: 5678567, seller_code: 2345234, seller_name: "Karl", client_code: 192, client_name: "Antoni", product_code: 213, product_description: "Computador Lenovo", payment_type: 
    "Boleto", request_number: 92834234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Nota Fical Emitida", date_service: "2018-10-15", date_transmission_note: "2018-10-25"},

    {branch: 3, service_number: 2234523, seller_code: 2345234, seller_name: "Karl", client_code: 192, client_name: "Antoni", product_code: 213, product_description: "Computador Lenovo", payment_type: 
    "Boleto", request_number: 92834234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Nota Fical Emitida", date_service: "2018-10-15", date_transmission_note: "2018-10-25"},
            
    {branch: 4, service_number: 45645645, seller_code: 2345234, seller_name: "Karl", client_code: 192, client_name: "Antoni", product_code: 213, product_description: "Computador Lenovo", payment_type: 
    "Boleto", request_number: 92834234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Nota Fical Emitida", date_service: "2018-10-15", date_transmission_note: "2018-10-25"},

    {branch: 5, service_number: 345623427, seller_code: 2345234, seller_name: "Karl", client_code: 192, client_name: "Antoni", product_code: 213, product_description: "Computador Lenovo", payment_type: 
    "Boleto", request_number: 92834234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Nota Fical Emitida", date_service: "2018-10-15", date_transmission_note: "2018-10-25"},

    {branch: 6, service_number: 34563, seller_code: 2345234, seller_name: "Karl", client_code: 192, client_name: "Antoni", product_code: 213, product_description: "Computador Lenovo", payment_type: 
    "Boleto", request_number: 92834234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Nota Fical Emitida", date_service: "2018-10-15", date_transmission_note: "2018-10-25"},

    {branch: 7, service_number: 2345234, seller_code: 2345234, seller_name: "Karl", client_code: 192, client_name: "Antoni", product_code: 213, product_description: "Computador Lenovo", payment_type: 
    "Boleto", request_number: 92834234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Nota Fical Emitida", date_service: "2018-10-15", date_transmission_note: "2018-10-25"},

    {branch: 8, service_number: 2345234, seller_code: 2345234, seller_name: "Karl", client_code: 192, client_name: "Antoni", product_code: 213, product_description: "Computador Lenovo", payment_type: 
    "Boleto", request_number: 92834234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Nota Fical Emitida", date_service: "2018-10-15", date_transmission_note: "2018-10-25"}
])