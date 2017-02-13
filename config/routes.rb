Rails.application.routes.draw do

  resources :companies do
    resources :contacts, only: [:create]
    resources :jobs do
      resources :comments, only: [:create]
    end
  end

  resources :categories
  resources :jobs, only: [:index]

  get "/dashboard", as: :dashboard, to: "dashboard#index"
end
