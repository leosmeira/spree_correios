module Spree
  class Calculator::CorreiosBaseCalculator < Calculator
    preference :zipcode, :string
    preference :token, :string
    preference :password, :string
    preference :declared_value, :boolean, :default => false
    preference :receipt_notification, :boolean, :default => false
    preference :receive_in_hands, :boolean, :default => false
    preference :fallback_amount, :string
    preference :fallback_timing, :string
    preference :default_box_price, :string

    attr_accessor :delivery_time
    attr_accessible :preferred_zipcode, :preferred_token,
                    :preferred_password, :preferred_declared_value,
                    :preferred_receipt_notification, :preferred_receive_in_hands, 
                    :preferred_fallback_amount, :preferred_default_box_price,
                    :preferred_fallback_timing

    def compute(object)
      return unless object.present? and object.line_items.present?

      order      = object.is_a?(Spree::Order) ? object : object.order
      package    = package_from_order(order)
      calculator = calculator_for_package_of_order(package, order)
      
      begin
         webservice = calculator.calculate(shipping_method)
      rescue
        webservice = OpenStruct.new(:valor => prefers?(:fallback_amount).to_f, :prazo_entrega => prefers?(:fallback_timing))
      end

      @delivery_time = webservice.prazo_entrega
      webservice.valor +  prefers?(:default_box_price).to_f
    end

    def delivery_time
      @delivery_time || prefers?(:fallback_timing)
    end

    def available?(order)
      #!compute(order).zero? #requisição repetida ao Webservice dos Correios quando order.rate_hash é chamado (available_shipping_methods & cost = calculator.compute) 
      true
    end

    def has_contract?
      preferred_token.present? && preferred_password.present?
    end

    def package_from_order(order)
      ::Correios::Frete::Pacote.new.tap do |package|
        order.line_items.map do |item|
          weight = item.product.weight.to_f
          depth  = item.product.depth.to_f
          width  = item.product.width.to_f
          height = item.product.height.to_f
          
          item.quantity.times do |n|
            package_item = ::Correios::Frete::PacoteItem.new(:peso => weight, :comprimento => depth, :largura => width, :altura => height)
            package.add_item(package_item)
          end
          
        end
      end
    end

    def calculator_for_package_of_order(package, order)
      ::Correios::Frete::Calculador.new do |c|
        c.encomenda         = package

        c.cep_origem        = preferred_zipcode
        c.cep_destino       = order.ship_address.zipcode
        c.valor_declarado   = order.amount.to_f  if prefers?(:declared_value)

        c.codigo_empresa    = preferred_token    if preferred_token.present?
        c.senha             = preferred_password if preferred_password.present?

        c.mao_propria       = prefers?(:receive_in_hands)
        c.aviso_recebimento = prefers?(:receipt_notification)
      end
    end
  end
end
