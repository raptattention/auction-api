Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :products do
  	resources :bids
  	resources :orders
  end
  resources :area_codes do
  	resources :phone_numbers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
