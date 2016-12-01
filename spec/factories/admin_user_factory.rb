FactoryGirl.define do

	factory :admin_user do #normally would define class: User but factory_girl can guess the class because of the model 
		email 
    password 
  end

end
