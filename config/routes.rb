Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
	root 'static#index'
  resources :appointment
	get '/Footer_apropos', to: 'static#Footer_apropos'
	get '/Footer_reseaux', to: 'static#Footer_reseaux'
	get '/Footer_confidentialite', to: 'static#Footer_confidentialite'
	get '/Footer_cookies', to: 'static#Footer_cookies'

  resources :events do
    resources :photos, only: [:create]
    collection do
      get 'created_index'
    end
  end

end
