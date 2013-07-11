Blog::Application.routes.draw do
  root 'posts#index'

  resources :posts, only: [:index, :new, :create] do
    resources :ratings, only: [:create]
  end
end
