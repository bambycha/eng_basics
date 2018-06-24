Rails.application.routes.draw do
  resources :fibs

  root 'home#index'
end
