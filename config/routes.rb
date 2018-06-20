Rails.application.routes.draw do
  resources :standards
  resources :badges do
    member do
      get 'new_version'
    end
  end
  resources :students
  devise_for :users
  resources :users
  root to: "home#index"
end
