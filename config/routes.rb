Blog::Application.routes.draw do
  root 'posts#index'

  resources :posts, only: [:index, :new, :create] do
    resources :comments, only: [:create]
  end
end
