Rails.application.routes.draw do

 get "tasks/index", to:"tasks#index"
 get "tasks/show", to:"tasks#show"
 resources :tasks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
