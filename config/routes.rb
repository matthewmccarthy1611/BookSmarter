Rails.application.routes.draw do
  resources :comments
  resources :books
  root to: "static#home"

  devise_for :users, :controllers => {registrations: 'registrations' }
  
end
