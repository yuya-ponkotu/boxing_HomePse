Rails.application.routes.draw do
  get 'events/index'
  devise_for :owners
  root to: 'pages#index'
  resources :users
  resources :events, only: [:index, :new, :create, :edit, :destroy, :update]
  post '/entry_exit_managements/update', to: 'entry_exit_managements#update'
  get '/entry_exit_managements/index', to: 'entry_exit_managements#index'
  post '/users/:id/edit', to: 'users#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/readme', to: 'pages#readme'
end
