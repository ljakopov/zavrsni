Rails.application.routes.draw do

  resources :users


  match ':controller(/:action(/:id))', :via => [:get, :post]


  root "access#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
