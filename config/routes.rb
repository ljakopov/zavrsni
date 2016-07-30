Rails.application.routes.draw do



  resources :users do
    resources :posts
  end

  resources :friendships

  resources :posts do
    resources :comments
  end

  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  match ':controller(/:action(/:id))', :via => [:get, :post]


  root "posts#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
