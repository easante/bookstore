class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def order_total
    order_items.to_a.inject(0.0) { |sum, item| sum + item.quantity * item.price }
  end
end
