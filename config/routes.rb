Rails.application.routes.draw do
  resources :standards
  resources :badges do
    member do
      get 'new_version'
    end
  end
  resources :students
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
