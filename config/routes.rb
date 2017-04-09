Rails.application.routes.draw do
  root 'static_pages#home'
  get 'mesa/mesapjs'
  get 'mesa/mesaplot'
  get 'mesa/mesaface'
  get 'demo_pages/template'
  
  get '/techinmiami' => 'techinmiami#index'
  get 'techinmiami/events'
  post 'techinmiami/newevent'
  get 'techinmiami/list'

  get '/blogs' => 'blogs#index'

  get '/works' => 'works#index'

  get '/me' => 'static_pages#me'

  get 'users/admin'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
