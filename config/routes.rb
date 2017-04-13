Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home2'

  get 'demo_pages/template'
  
  get '/techinmiami' => 'techinmiami#index'
  get 'techinmiami/index'

  post 'techinmiami/newevent'
  delete 'techinmiami/destroyEvent'
  get 'techinmiami/list'

  get '/blogs' => 'blogs#index'
  resources :posts

  get '/works' => 'works#index'

  get '/me' => 'static_pages#me'

  get 'users/admin'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'mesa/mesapjs'
  get 'mesa/mesaplot'
  get 'mesa/mesaface'
  get 'techinmiami/testEventLayout'
  get 'techinmiami/testEventLayout1'
  get 'techinmiami/testEventLayout2'
  get 'techinmiami/testEventLayout3'
end
