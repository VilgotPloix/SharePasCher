Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
	root 'static#index'
  resources :appointment

  resources :events do
    collection do
      get 'created_index'
    end
  end

end
