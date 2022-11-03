Rails.application.routes.draw do

 resources :tasks
 get "tasks/index", to:"tasks#index"
 get "tasks/show", to:"tasks#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
