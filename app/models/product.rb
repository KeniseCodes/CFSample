class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments

	validates :name, presence: true

	def average_rating
		comments.average(:rating).to_f
	end
	
	def price_in_cents
  (self.price.to_f*100).to_i
 end
 
end
