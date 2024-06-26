Rails.application.routes.draw do
  get 'main_site/index'
  get 'main_site/my_courses'
  post 'main_site/register/:section_id', to: 'main_site#register', as: 'register_main_site'
  post 'main_site/unregister/:section_id', to: 'main_site#unregister', as: 'unregister_main_site'
  post 'main_site/change_grade/:section_id/:section_id:', to: 'main_site#change_grade', as: 'change_grade_main_site'
  resources :sections
  resources :courses
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
end
