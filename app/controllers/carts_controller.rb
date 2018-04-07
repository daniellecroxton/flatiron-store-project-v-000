class CartsController < ApplicationController

  def show
    @cart = current_user.current_cart
    # raise Cart.first.inspect
    if @cart == nil
      flash.notice = "Your cart is currently empty"
    end
  end

  def checkout
    @cart = current_user.current_cart
    @cart.checkout
    @cart.clear
    redirect_to cart_path(params[:id])
  end

end
