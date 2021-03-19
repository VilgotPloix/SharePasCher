Rails.application.routes.draw do
  devise_for :users
	root 'static#index'
  resources :appointment, only: [:index, :create, :show, :new, :update, :destroy]

  resources :events, only: [:index, :new, :show, :edit, :create, :destroy]
  devise_for :users
	

  resources :events do
    collection do
      get 'created_index'
    end
  end

end
