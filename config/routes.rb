Rails.application.routes.draw do
  # Devise routes
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signUp'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # API routes
  namespace :api do
    resources :users do
      resources :service_requests, only: [:index]
    end
    resources :service_requests, only: [:index_all, :create]
  end
  
end
