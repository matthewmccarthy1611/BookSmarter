Rails.application.routes.draw do
  root to: "static#home"

  devise_for :users, :controllers => {registrations: 'registrations' }

  resources :users do
    resources :books, only: [:new, :create, :index]
  end
  resources :comments
  resources :books do
    resources :comments, only: [:new, :create, :index]
  end

  get '/users/most_books'
  
end
