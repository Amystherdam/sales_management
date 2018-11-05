module ApplicationHelper
    def seller_amount(vendedor, buscar)
        buscar.where(seller_code: vendedor.seller_code).sum(:amount)
    end

    def percent_of(vendas_vendedor, total_vendas)
        vendas_vendedor.to_f / total_vendas.to_f * 100.0
    end
end
