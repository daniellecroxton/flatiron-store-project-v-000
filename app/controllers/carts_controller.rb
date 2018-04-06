class CartsController < ApplicationController

  def show
    # raise Cart.first.inspect
    @cart = Cart.find_by_id(params[:id])
    # if @cart == nil
    #   flash.notice = "Your cart is currently empty"
    # end
  end

  def checkout
    @cart = Cart.find_by_id(params[:id])
    @user = User.find_by_id(@cart.user_id)
    @cart.subtract_from_inventory
    @cart.status = "submitted"
    @user.current_cart.clear
    redirect_to cart_path(@cart)
  end

end
