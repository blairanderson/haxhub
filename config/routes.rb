Softline::Application.routes.draw do
  root to: 'dashboard#show'
  resource :dashboard

  get '/auth/github' => 'authentication#github', as: 'github_auth'
  get '/auth/github/redirect' => 'authentication#github_redirect', as: 'github_redirect'

  get '/logout' => 'authentication#destroy', as: 'logout'
end
