require 'rails_helper'

describe Comment do
	it "has no user" do
			expect(Comment.new(body: "ipsum lorum")).not_to be_valid
	end

end