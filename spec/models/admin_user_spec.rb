require 'rails_helper'

describe AdminUser do
	context "has an account" do
		before do
			@admin_user = FactoryGirl.create(:admin_user)
		end

		it "has no encrypted_password" do
			expect(AdminUser.new(email: "admin@mail.de")).not_to be_valid
		end

		it "has no email" do
			expect(AdminUser.new(password: "password")).not_to be_valid
		end

	end
	
end

