Rails.application.routes.draw do
  # resources :identification_types
  resources :academic_programs
  resources :academic_departaments
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

  namespace :self_evaluations, path: "/acreditacion" do
    get 'muestreos', to: 'sampling_instruments#index', as: "sampling_instruments"
    namespace :sampling_instruments, path: "/muestreos" do
      resources :students, path: 'estudiantes', param: :code, only: [:index] do
        collection { post :import }
        collection { get '/:semesters', to: 'students#index_semester', as: "index_semester_other"}
        collection { post :index_semester_post }
      end
      resources :teachers, path: 'profesores', param: :code, only: [:index] do
        collection { post :import }
      end
      get 'formula', to: 'sampling_formula#index', as: "sampling_formula"
    end
  end
end
