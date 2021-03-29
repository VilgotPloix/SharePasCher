Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
	root 'static#index'
  resources :appointment
	get '/footer_apropos', to: 'static#footer_apropos'
	get '/footer_reseaux', to: 'static#footer_reseaux'
	get '/footer_confidentialite', to: 'static#footer_confidentialite'
	get '/footer_cookies', to: 'static#footer_cookies'

  resources :events do
    resources :photos, only: [:create]
    collection do
      get 'created_index'
    end
  end

end
