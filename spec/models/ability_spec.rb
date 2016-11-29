require 'rails_helper'
require 'cancan/matchers'

describe Ability do
	context "user is not the admin" do
		before do
			@product 	= Product.create!(name: "surf board")
			@user 		= User.create!(email: "molly@mail.net", password: "password1")
			@ability = Ability.new(@user)
			@product.comments.create!(rating: 1, user: @user, body: "bad leash broke")
		end 

		it "destroys comment" do
			expect(@ability.can?(:destroy, @product.comments(:user => @user))).to be false
		end
	end
end
