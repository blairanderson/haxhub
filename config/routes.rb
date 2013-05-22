require 'resque/server'

Softline::Application.routes.draw do
  mount Resque::Server.new, :at => "/resque"

  root to: 'home#show'
  resources :projects, only: [:create]

  match '/webhook' => 'projects#webhook', as: 'webhook'

  post '/add_planner' => 'projects#add_planner'
  put '/toggle_build_status' => 'projects#toggle_build_status'

  delete '/projects' => 'projects#destroy', as: 'project'
  get '/dashboard' => 'dashboard#show'

  get '/:project_id/git_actions' => "git_actions#index", as: "git_actions"
  get '/:project_id/test_builds' => "test_builds#index", as: "test_builds"
  get '/:project_id/activities' => "activities#index", as: "activities"

  get '/auth/github'          => 'authentication#github_auth',     as: 'github_auth'
  get '/auth/github/callback' => 'authentication#github_callback', as: 'github_callback'
  get '/logout'               => 'authentication#destroy',         as: 'logout'
end
