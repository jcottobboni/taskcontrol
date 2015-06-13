Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :comments
  resources :tasks
  root :to => "tasks#index"
end
