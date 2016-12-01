FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
	sequence(:password) { |n| "password#{n}" }

	factory :user do #normally would define class: User but factory_girl can guess the class because of the model 
		email 
    password 
    first_name "Molly"
    last_name "Mayer"
  end

end
