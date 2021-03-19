Rails.application.routes.draw do
  devise_for :users
	root 'static#index'
  resources :appointment

  resources :events do
    collection do
      get 'created_index'
    end
  end

end
