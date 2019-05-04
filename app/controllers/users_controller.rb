class UsersController < ApplicationController
	def my_portfolio
		@user = current_user
		@user_stocks = current_user.stocks
	end

	def my_friends
		@friendships = current_user.friends
	end

	def search
		if params[:friend].present?
			@friends = User.search(params[:friend])
			render json: @friends 
		else
		end
	end
end
