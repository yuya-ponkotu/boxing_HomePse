Rails.application.routes.draw do
  root to: 'pages#index'
  resources :users
  post '/entry_exit_managements/update', to: 'entry_exit_managements#update'
  get '/entry_exit_managements/index', to: 'entry_exit_managements#index'
  post '/users/:id/edit', to: 'users#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
