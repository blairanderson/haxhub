require 'resque/server'

Softline::Application.routes.draw do
  mount Resque::Server.new, :at => "/resque"

  root to: 'home#show'
  resources :projects, only: [:create]

  post '/add_planner' => 'projects#add_planner'
  put '/toggle_build_status' => 'projects#toggle_build_status'

  get '/dashboard' => 'dashboard#show'

  get '/:project_id/git_actions' => "git_actions#index", as: "git_actions"

  get '/auth/github'          => 'authentication#github_auth',     as: 'github_auth'
  get '/auth/github/callback' => 'authentication#github_callback', as: 'github_callback'
  get '/logout'               => 'authentication#destroy',         as: 'logout'
end
