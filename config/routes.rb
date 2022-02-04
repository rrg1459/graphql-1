Rails.application.routes.draw do

  root 'diccionarios#index'

  resources :diccionarios

  get 'analiza/lee'
  post '/procesa', to: 'analiza#procesa'
  get '/update', to: 'analiza#update'
  get '/manage_words', to: 'analiza#manage'

end
