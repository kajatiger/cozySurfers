class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true
  belongs_to :comment
  belongs_to :product
  #attr_accessible :rate, :dimension

end