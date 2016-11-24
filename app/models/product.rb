class Product < ApplicationRecord
	has_many :orders
	has_many :comments, :dependent => :destroy
	has_many :ratings 
	def highest_rating_comment
  	comments.rating_desc.first
	end
	ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'
end
