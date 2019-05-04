class UsersController < ApplicationController
	def my_portfolio
		@user = current_user
		@user_stocks = current_user.stocks
	end

	def my_friends
		@friendships = current_user.friends
	end

	def search
		if params[:search_value].present?
			@friends = User.search(params[:search_value])
			if @friends.present?
				render 'users/my_friends'
			else
				flash[:danger] = "No friends match with this search criteria."
				redirect_to my_friends_path
			end
		else
			flash[:danger] = "You have entered an empty string."
			redirect_to my_friends_path
		end
	end
end
