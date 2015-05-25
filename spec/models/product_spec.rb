require 'rails_helper'

describe Product do

 	before { @product = Product.new(name: "Kite Board") }

 	context "has name" do
 		it "should be valid" do
 			expect(@product).to be_valid
			end
		end
end

describe Product do
		before { @product = Product.new(name: nil) }

 	context "has no name" do
 		it "should not be valid" do
			expect(@product.save).to eq false
		end
	end
end 


describe Product do

 	before {
 		@product = Product.new(name: "test")
 		@product.save
 		Comment.new(body: "great", rating: 1, product_id: @product.id).save
		Comment.new(body: "awesome", rating: 3, product_id: @product.id).save
 		Comment.new(body: "whatever", rating: 5, product_id: @product.id).save
 		#binding.pry
 			}

 	context "has several ratings" do
 		it "average_rating should equal the average" do
 			expect(@product.average_rating).to eq 3
			end
		end
end
