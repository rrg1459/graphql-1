Rails.application.routes.draw do

  root 'game#play'
  # root 'diccionarios#index'
  
  resources :diccionarios
  
  get 'game/play'
  get 'analiza/lee'
  post '/procesa', to: 'analiza#procesa'
  get '/update', to: 'analiza#update'
  get '/manage_words', to: 'analiza#manage'
  get '/play', to: 'game#play'

end
