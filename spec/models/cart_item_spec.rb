require 'spec_helper'

describe CartItem do
  it { should belong_to(:cart) }
  it { should belong_to(:book) }
  it { should validate_numericality_of(:book_id).only_integer.is_greater_than(0) }

  it "should return the total line item amount" do
    book = Fabricate(:book, price: 10)
    cart = Fabricate(:cart)

    cart_item = Fabricate(:cart_item, book: book, cart: cart, quantity: 2, price: 10)

    expect(cart_item.line_total).to eq(20)
  end
end
