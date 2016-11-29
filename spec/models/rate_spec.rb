require 'rails_helper'


describe Rate do
	before do
		@product	= Product.create!(name: "sexwax")
		@user			= User.create!(email: "molly@mail.no", password: "secret")
		@comment 	= @product.comments.create!(body: "good wax", user: @user)
		@rating 	= @comment.rating
	end

	it { should belong_to(:product) }
	
end