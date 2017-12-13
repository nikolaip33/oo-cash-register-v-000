require 'pry'
class CashRegister

  attr_accessor :total, :discount, :last_price, :items


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
  end

  def add_item(title, price, quantity = 1)
    @items.fill(title, @items.size, quantity)
    @total += price * quantity
    @last_price = price
  end

  def apply_discount
    if self.discount == nil
      "There is no discount to apply."
    else
      discounted = total * (discount/100)
      binding.pry
      self.total = total - discounted
      "After the discount, the total comes to $#{total}."
    end
  end

  def items
    @items.collect { |item, price| item }
  end

  def void_last_transaction
    @total -= @last_price
  end

end #class CashRegister
