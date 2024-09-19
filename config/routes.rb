Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'api/v1/students', to: "api/v1/students#create"

  namespace :api do
    namespace :v1 do
      resources :schools , only: [] do
        resources :klasses, only: %i[ index ] do
          resources :students, only: %i[ destroy index ], shallow: true
        end
      end
    end
  end
end
