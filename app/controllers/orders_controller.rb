class OrdersController < ApplicationController
  before_action :require_signin
  before_action :set_cart

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build()
    transfer_cart_items

    if @order.save
      @cart.destroy
      session[:cart_id] = nil

      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      token = params[:stripeToken]
      begin
        charge = Stripe::Charge.create(
          amount: (@cart.total_sale * 100).to_i,
          currency: "usd",
          card: token
        )
        flash[:success] = "Order has been created."
        redirect_to root_path
      rescue Stripe::CardError => e
        flash[:danger] = "Order has not been created."
        redirect_to root_path
      end
    end
  end

private
  def transfer_cart_items
#    require 'pry';binding.pry
    @cart.cart_items.each do |item|
      @order.order_items << OrderItem.new(
        book_id: item.book_id,
        quantity: item.quantity,
        price: item.price
      )
    end
  end
end
