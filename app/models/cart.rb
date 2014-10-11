class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items

  def add_book_to_items(book_id)
    item = cart_items.where(book_id: book_id).first
    book_price = Book.find(book_id).price

#    require 'pry';binding.pry
    if item.nil?
      cart_items.create(book_id: book_id, quantity: 1, price: book_price)
      # item = cart_items.build(book_id: book_id, quantity: 1, price: book_price)
    else
      quantity = item.quantity + 1
      cart_items.first.update(quantity: quantity)
    end
  end

  def total_sale
    cart_items.map { |ci| ci.quantity * ci.price }.reduce(:+)
    # cart_items.to_a.map { |ci| ci.quantity * ci.price }.reduce(:+)
  end
end
