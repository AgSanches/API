class OrderProductSerializer < ActiveModel::Serializer

  attributes :product_id, :quantity, :totalPrice, :unitPrice, :order_id
end
