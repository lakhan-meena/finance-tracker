class User < ApplicationRecord
	has_many :user_stocks
	has_many :stocks, through: :user_stocks
	has_many :friendships
	has_many :friends, through: :friendships
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 	def stock_already_added?(ticker_symbol)
 		stock = Stock.find_by(ticker: ticker_symbol)
 		return false unless stock
 		user_stocks.where(stock_id: stock.id).exists?
 	end

 	def under_stock_limit?
 		(user_stocks.count < 10 )
 	end

 	def can_add_stock?(ticker_symbol)
 		under_stock_limit? && !stock_already_added?(ticker_symbol)
 	end

 	def self.search(data)
 		data.strip!
 		results = (full_name_matches(data) + email_matches(data)).uniq
 		return nil unless results
 		results
 	end

 	def self.full_name_matches(data)
 		matches('full_name', data)
 	end

 	def self.email_matches(data)
 		matches('email', data)
 	end

 	def self.matches(field_name, data)
 		User.where("#{field_name} like ?", "%#{data}%")
 	end
end
