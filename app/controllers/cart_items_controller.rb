class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    @cart_item = @cart.add_book_to_items(params[:book_id])
    if @cart_item.save
      flash[:success] = "Cart item has been created."
      redirect_to @cart_item.cart
    else
      flash[:danger] = "Cart item has not been created."
      render :new
    end
  end
end
