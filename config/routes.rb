Rails.application.routes.draw do
  # resources :identification_types
  resources :academic_programs
  # resources :academic_departaments
  resources :faculties
  resources :users, param: :uuid
  devise_for :users, :skip => [:registrations],
    path: '',
    path_names: {
      sign_in: 'signin',
      sign_out: 'signout',
      sign_up: 'get-started',
      password: 'password'
    },
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords",
      confirmations: "users/confirmations"
    }

  devise_scope :user do
    authenticated :user do
      root 'users/profile#show', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :users, path: "/u" do
    get 'profile', to: 'profile#show'
    get 'new-user', to: 'registrations#new'
  end
end
