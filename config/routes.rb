Rails.application.routes.draw do

  resources :activities, :only => [:create, :index]


  resources :users do
    resources :posts
  end

  resources :users, :only => [:admin, :active, :confirm_email]    do
    member do
      get "admin" => "users#admin"
      get "active" => "users#active"
      get "confirm_email" => "users#confirm_email"
    end
  end

  resources :friendships, :only => [:index, :new, :create, :delete]

  resources :posts do
    resources :comments
  end

  resources :comments, :only => [:create]

  resources :users do
    resources :groups do
      resources :group_users
    end
  end


  resources :posts, :only => [:upvote, :downvote] do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  match ':controller(/:action(/:id))', :via => [:get, :post]

  root "posts#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
