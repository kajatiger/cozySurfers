Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :registrations => "user_registrations" }

  resources :users

  get 'users/sign_in'

  get 'users/show'

	resources :orders, only: [:index, :show, :create, :destroy]
  
  get 'orders/index'

  resources :products do
    resources :comments
  end

  post 'payments/create'
  
  get 'products/index'

  get 'products/new'

  get 'products/show'

  post 'static_pages/thank_you'

  get 'static_pages/about'

  get 'static_pages/contact'

  root 'static_pages#landing_page'

  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
