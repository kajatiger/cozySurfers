class Product < ApplicationRecord
	has_many :orders
	has_many :comments, :dependent => :destroy

	def highest_rating_comment
  	comments.rating_desc.first
	end

end
