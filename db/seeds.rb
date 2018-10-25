# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create(email: "lucas10@gmail.com", password: "123abc")

Business.create([
    {branch: 1, service_number: 578567, seller_code: 456765456, seller_name: "Hershell", client_code: 1932, client_name: "Cecomil", product_code: 24313, product_description: "Computador Lenovo", payment_type: 
    "Orcamento", request_number: 9284234, product_quantity: 3, product_value: 2000, product_discount: 0, amount: 6000, business_situation: "Em Orçamento", date_service: "2018-10-01", date_transmission_note: "2018-10-10"},
    
    {branch: 1, service_number: 568567, seller_code: 4544656, seller_name: "Hershell", client_code: 194, client_name: "Ibyte", product_code: 21343, product_description: "Tablet Samsung", payment_type: 
    "Debito", request_number: 924234, product_quantity: 2, product_value: 800, product_discount: 0, amount: 1600, business_situation: "Emissão Liberada", date_service: "2018-10-12", date_transmission_note: "2018-10-14"},

    {branch: 3, service_number: 2333333, seller_code: 634532456, seller_name: "Hershell", client_code: 1952, client_name: "Casa Civil", product_code: 214563, product_description: "Notebook Acer", payment_type: 
    "Debito", request_number: 9283424, product_quantity: 5, product_value: 1800, product_discount: 0, amount: 9000, business_situation: "Cancelada", date_service: "2018-10-14", date_transmission_note: "2018-10-31"},
            
    {branch: 4, service_number: 22222222, seller_code: 3456345, seller_name: "Hershell", client_code: 1692, client_name: "Assembleia", product_code: 22313, product_description: "Processador i5", payment_type: 
    "Boleto", request_number: 9283423, product_quantity: 6, product_value: 850, product_discount: 0, amount: 5100, business_situation: "Nota Fical Emitida", date_service: "2018-10-05", date_transmission_note: "2018-10-20"},

    {branch: 2, service_number: 5555555, seller_code: 345234, seller_name: "Michone", client_code: 1972, client_name: "Google", product_code: 23413, product_description: "Notebook Lenovo", payment_type: 
    "Dinheiro", request_number: 2834234, product_quantity: 10, product_value: 1950, product_discount: 0, amount: 19500, business_situation: "Nota Fical Emitida", date_service: "2018-10-08", date_transmission_note: "2018-10-15"},

    {branch: 6, service_number: 34563, seller_code: 23454, seller_name: "Michone", client_code: 1892, client_name: "Apple", product_code: 21653, product_description: "Smarthphone Samsung J5", payment_type: 
    "Boleto", request_number: 9834234, product_quantity: 3, product_value: 600, product_discount: 0, amount: 1800, business_situation: "Nota Fical Emitida", date_service: "2018-10-11", date_transmission_note: "2018-10-13"},

    {branch: 5, service_number: 657453, seller_code: 354454322, seller_name: "Michone", client_code: 1992, client_name: "IBM", product_code: 2513, product_description: "HDD Externo Exbom", payment_type: 
    "Orcamento", request_number: 934234, product_quantity: 1, product_value: 340, product_discount: 0, amount: 340, business_situation: "Em Orçamento", date_service: "2018-10-10", date_transmission_note: "2018-10-15"},

    {branch: 3, service_number: 3333333, seller_code: 2341233, seller_name: "Lori", client_code: 1912, client_name: "R7 Informática", product_code: 28713, product_description: "Fone Razer", payment_type: 
    "Boleto", request_number: 92423554, product_quantity: 2, product_value: 450, product_discount: 0, amount: 900, business_situation: "Cancelada", date_service: "2018-10-10", date_transmission_note: "2018-10-30"}
])