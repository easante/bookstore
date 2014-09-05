require 'spec_helper'

describe Cart do
  it { should have_many(:cart_items) }
  it { should have_many(:books).through(:cart_items) }

  it "should return a cart item with book quantity 1 if that book is not already in cart" do
    book = Fabricate(:book)
    cart = Fabricate(:cart)

    expect(cart.add_book_to_items(book.id).quantity).to eq(1)
  end

  it "should return a cart item with book quantity 2 if that book is already in cart" do
    book = Fabricate(:book)
    cart = Fabricate(:cart)
    cart_item = Fabricate(:cart_item, book: book, cart: cart, quantity: 1)

    expect(cart.add_book_to_items(book.id).quantity).to eq(2)
  end

  it "should return the total sale value for items in the cart" do
    book1 = Fabricate(:book, price: 20)
    book2 = Fabricate(:book, price: 10)

    cart = Fabricate(:cart)
    cart_item1 = Fabricate(:cart_item, book: book1, cart: cart, quantity: 1, price: book1.price)
    cart_item2 = Fabricate(:cart_item, book: book2, cart: cart, quantity: 1, price: book2.price)
#require 'pry';binding.pry
    expect(cart.total_sale).to eq(cart_item1.price + cart_item2.price)
  end
end
