Whisper::Application.routes.draw do
  resources :articles, :only => %w(index new create edit update)
  get 'articles/:slug' => 'articles#show', :as => :article

  get 'dashboard' => 'dashboard#index'

  root :to => "articles#index"
end
