Rails.application.routes.draw do
  resources :appointment, only: [:index, :create, :show, :new, :update, :destroy]
  resources :events, only: [:index, :show, :edit, :create, :destroy]
  devise_for :users
	root 'static#index'
	resources :users do
		patch :update_host
		patch :update_traveler
	end
	resources :events
end
