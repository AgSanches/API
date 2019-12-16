class OrderSerializer < ActiveModel::Serializer

  def getOrders
    self.object.order_products.map do |order|
      order
    end
  end

  def getTotal
    price = 0
    self.object.order_products.map do |order|
      price += order.totalPrice
    end
    return  price
  end

  attributes :phone, :city, :country, :methodpayment, :passport, :street, :methodship, :getOrders, :getTotal, :created_at
end
