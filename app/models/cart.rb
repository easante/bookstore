class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items

  def add_book_to_items(book_id)
    item = cart_items.where(book_id: book_id).first
    book_price = Book.find(book_id).price

#    require 'pry';binding.pry
    if item.nil?
      item = cart_items.build(book_id: book_id, quantity: 1, price: book_price)
    else
      item.quantity += 1
      item
    end
  end

  def total_sale
    cart_items.map { |ci| ci.quantity * ci.price }.reduce(:+)
    # cart_items.to_a.map { |ci| ci.quantity * ci.price }.reduce(:+)
  end
end
