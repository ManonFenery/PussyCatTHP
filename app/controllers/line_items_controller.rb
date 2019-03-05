class LineItemsController < ApplicationController

#If it is a new product then create a new line_item and append the product and cart to it. 
#If the cart already has this product then find the line_item with this product and increment its quantity by 1
	def create
		#Find associated item and current cart
		chosen_item = Item.find(params[:item_id])
		current_cart = @current_cart

		#If cart already has this item then find the relevant line_item and iterate quantity 
		#OTHERWISE create a new line_item for this product
		if current_cart.items.include?(chosen_item)
			#Find the line_item with the chosen_item
			@line_item = current_cart.line_items.find_by(:item_id => chosen_item)
			#Iterate the line_item's quantity by one
			@line_item.quantity += 1
		else
			@line_item = LineItem.new
			@line_item.cart = current_cart
			@line_item.item = chosen_item
		end

		# Save and redirect to cart show path
		@line_item.save
		redirect_to cart_path(current_cart)
	end


#Find the current LineItem, destroy and redirect back to cart
	def destroy
		@line_item = LineItem.find(params[:id])
		@line_item.destroy
		redirect_to cart_path(@current_cart)
	end


#Find line_item then increment or decrement, save and redirect back to cart show page
	def add_quantity
		@line_item = LineItem.find(params[:id])
		@line_item.quantity += 1
		@line_item.save
		redirect_to cart_path(@current_cart)
	end

#Same logic in reduce_quantity to ensure cannot reduce below 1
	def reduce_quantity
		@line_item = LineItem.find(params[:id])
		if @line_item.quantity > 1
			@line_item.quantity -= 1
		end
		@line_item.save
		redirect_to cart_path(@current_cart)
	end

	private

	def line_item_params
		params.require(:line_item).permit(:quantity, :item_id, :cart_id)
	end

end


