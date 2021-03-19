Rails.application.routes.draw do
  resources :events, only: [:index, :show, :edit, :create, :destroy]
  devise_for :users
	root 'static#index'
end
