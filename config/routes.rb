Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/', to: 'users#index'
  get '/profils', to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
