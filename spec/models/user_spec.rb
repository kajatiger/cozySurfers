require 'rails_helper'

describe User do
	context "when the user is signed up" do
		
		it "has no email" do
			expect(User.new(password: "password")).not_to be_valid
		end
	end
end