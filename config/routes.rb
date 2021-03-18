Rails.application.routes.draw do
  devise_for :users
	root 'static#index'
	resources :users do
		patch :update_host
		patch :update_traveler
	end
	resources :events
end
