Rails.application.routes.draw do
  root 'static_pages#home'
  get 'mesa/mesapjs'
  get 'mesa/mesaplot'
  get 'mesa/mesaface'
  get 'demo_pages/template'
  get 'static_pages/techinmiami'

  get 'users/admin'
  # get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
