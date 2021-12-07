Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :volunteering, only: [:create]
  end
  resources :volunteering, only: [:update, :edit, :show]

  get "dashboard", to: "pages#dashboard", as: "dashboard"
end
