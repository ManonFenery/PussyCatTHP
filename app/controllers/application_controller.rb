class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :current_cart

	
	private

#If a session[:cart_id] already exists then find the Cart with that id, if there is no cart with that id then set the session id to nil
	def current_cart
		if session[:cart_id]
			cart = Cart.find_by(:id => session[:cart_id])
			if cart.present?
				@current_cart = cart
			else
				session[:cart_id] = nil
			end
		end

#If there is no session[:cart_id] associated with this user then create a new cart and store it in the users session id
		if session[:cart_id] == nil
			@current_cart = Cart.create
			session[:cart_id] = @current_cart.id
		end
	end

end






