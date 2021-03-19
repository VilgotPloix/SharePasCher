Rails.application.routes.draw do
	root 'static#index'
  resources :appointment, only: [:index, :create, :show, :new, :update, :destroy]
  resources :events, only: [:index, :show, :edit, :new, :create, :destroy]
  devise_for :users
	
end
