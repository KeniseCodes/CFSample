require 'rails_helper'

describe Comment do
		before {
 		@comment = Comment.new( 
 		body: "Awesome!",
 		rating: 2)
 	}

 	context "has body" do
 		it "should return comment" do
			expect(@comment.body).to eq("Awesome!")
		end
	end

	context "has rating" do
 		it "should return 2" do
			expect(@comment.rating).to eq(2)
		end
	end
end 