class OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def new
  	@order = Order.new
    @cart = @current_cart
  end

  def create
  	@order = Order.new(order_params)
  	#Before saving, iterate through the current_cart's line_items and append them to the new order variable
  	@current_cart.line_items.each do |item|
  		@order.line_items << item
  		#Assign the cart_id of the line_item to nil (it stops the line_items being deleted after we destroy the cart after)
  		item.cart_id = nil
  	end
  	#Save the order after appending all line_items from the cart
  	@order.save
  	#Destroy the cart and set the session[:cart_id] = nil as the order and cart has been fulfilled and the user can start shopping for a new order
	#Redirect back to root_path
  	Cart.destroy(session[:cart_id])
  	session[:cart_id] = nil
  	redirect_to root_path
  end


  private
  def order_params
  	params.require(:order).permit(:name, :email, :address, :pay_method)
  end
end
