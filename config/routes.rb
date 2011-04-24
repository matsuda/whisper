Whisper::Application.routes.draw do
  controller 'sessions' do
    match '/auth/:provider/callback' => :create
    match '/signin' => :new, :as => :signin
    match '/signout' => :destroy, :as => :signout
  end

  resources :articles, :only => %w(index new create edit update)
  get 'articles/:slug' => 'articles#show', :as => :article

  get 'dashboard' => 'dashboard#index'

  root :to => "articles#index"
end
