Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :volunteerings, only: [:create]
  end
  resources :volunteerings, only: [:update, :edit, :show]

  get "dashboard", to: "pages#dashboard", as: "dashboard"
end
