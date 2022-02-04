Rails.application.routes.draw do

  get 'game/play'
  root 'diccionarios#index'

  resources :diccionarios

  get 'analiza/lee'
  post '/procesa', to: 'analiza#procesa'
  get '/update', to: 'analiza#update'
  get '/manage_words', to: 'analiza#manage'
  get '/play', to: 'game#play'

end
