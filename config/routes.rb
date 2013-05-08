Softline::Application.routes.draw do
  root to: 'dashboard#show'
  resource :dashboard
end
