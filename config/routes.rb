Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :articles do
    resource :article_times, only: [:create, :destroy] do
      collection do
          delete '/' => 'article_times#all_destroy'
          get 'congratulation'
        end
    end
  end
  resources :achievements,only: [:index,:destroy,:create]
  resources :users,only: [:show,:edit]
end
