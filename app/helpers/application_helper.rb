module ApplicationHelper
    def seller_amount(vendedor, buscar)
        buscar.where(seller_code: vendedor.seller_code).sum(:amount)
    end
end
