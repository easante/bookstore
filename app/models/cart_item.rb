class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :book

  validates :book_id, numericality: { only_integer: true, greater_than: 0 }

  def line_total
    price * quantity
  end
end
