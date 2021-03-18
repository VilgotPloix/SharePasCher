Rails.application.routes.draw do
	root 'static#index'
	resources :users do
		patch :update_host
		patch :update_traveler
	end
	resources :events
end
