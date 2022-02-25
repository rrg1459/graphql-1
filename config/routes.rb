Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
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
