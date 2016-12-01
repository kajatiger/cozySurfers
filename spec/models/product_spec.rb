require 'rails_helper'
require 'spec_helper'

describe Product do
	context "when the product has comments" do
		before do 
			@product 	= Product.create!(name: "surf board")
			@user 		= FactoryGirl.create(:user)
			@product.comments.create!(rating: 1, user: @user, body: "bad leash broke")
			@product.comments.create!(rating: 3, user: @user, body: "board is okay")
			@product.comments.create!(rating: 5, user: @user, body: "perfect for small waves")
		end 

		it "has no name" do
			expect(Product.new(description: "Nice board")).not_to be_valid
		end

		it "returns the average rating of all comments" do expect(@product.average_rating).to eq 3 end

	end	
end