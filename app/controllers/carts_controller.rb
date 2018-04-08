class CartsController < ApplicationController

  def show
    @cart = Cart.find_by_id(params[:id])
    if @cart == nil
      flash.notice = "Your cart is currently empty"
    end
  end

  def checkout
    # binding.pry
    current_user.current_cart.checkout
    current_user.remove_cart
    redirect_to cart_path(params[:id])
  end

end
