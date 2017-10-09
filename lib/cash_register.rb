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
    if @discount == 0
      message = "There is no discount to apply."
    else
      @total = @total * (100 - @discount)/100
      message = "After the discount, the total comes to $#{total}."
    end
    message
  end

  def items
    @items.collect { |item, price| item }
  end

  def void_last_transaction
    @total -= @last_price
  end

end #class CashRegister
