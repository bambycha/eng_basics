Rails.application.routes.draw do
  resources :fibs

  root 'fibs#index'
end
