class CartsController < ApplicationController
  before_action :set_cart

  def show
#    fail
     @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find params[:id]
    @cart.destroy
    session[:cart_id] = nil
    redirect_to catalogs_path
  end
end
