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
			expect(@product.name).to raise_error
		end
	end
end 

describe Product do

 	before {
 		@product = Product.new
 		@product.comments = Comment.new(
 			body: "Awesome!",
 			rating: [1, 3, 5])
 	}

 	context "has several ratings" do
 		it "average_rating should equal the average" do
 			expect(@product.comments.average_rating).to eq 3
			end
		end
end
