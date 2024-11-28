Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "render/index"
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  
  get '/logout', to: 'sessions#destroy'
  resources :users
  resources :reservations, only: [:index, :new, :create, :show, :destroy]
  
  namespace :admin do
    get 'dashboard', to: 'admin#dashboard'
    get 'manage_time_slots', to: 'admin#time_slots', as: :manage_time_slots
    get 'manage_reservations', to: 'admin#manage_reservations'
    resources :time_slots
    resources :reservations, only: [:index, :show, :edit, :destroy, :update]
    resources :tables, only: [:index, :create, :update, :destroy, :new, :edit, :show]  do
      member do
        put :toggle_availability  # This will respond to PUT requests for /admin/tables/:id/toggle_availability
      end
    end
  end  
  get "up" => "rails/health#show", as: :rails_health_check
  root 'static_pages#home'
end
