Rails.application.routes.draw do
  devise_for :users
	root 'static#index'
  resources :appointment, only: [:index, :create, :show, :new, :update, :destroy]
<<<<<<< HEAD
  resources :events do
    collection do
      get 'created_index'
    end
  end
=======
  resources :events, only: [:index, :show, :edit, :new, :create, :destroy]
  devise_for :users
	
>>>>>>> 870968c6109a78fbe533430d8772d41b3e82e9eb
end
