Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :assignments, only: [:index, :show, :create, :update]
      resources :employees, only: [:show, :index]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
