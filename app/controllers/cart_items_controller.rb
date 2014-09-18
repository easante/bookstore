class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    @cart_item = @cart.add_book_to_items(params[:book_id])
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to root_path }
        # format.html { redirect_to @cart_item.cart, success: 'Cart item has been created.' }
        format.js
        # flash[:success] = "Cart item has been created."
        # redirect_to @cart_item.cart
      else
        format.html { render :new }
        # flash[:danger] = "Cart item has not been created."
      end
    end
  end
end
