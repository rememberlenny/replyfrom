# Route prefixes use a single letter to allow for vanity urls of two or more characters
Rails.application.routes.draw do

  mount_griddler
  resources :accounts
  resources :prompts
  resources :emails

  if defined? Sidekiq
    require 'sidekiq/web'
    authenticate :user, lambda {|u| u.is_admin? } do
      mount Sidekiq::Web, at: '/admin/sidekiq/jobs', as: :sidekiq
    end
  end

  resources "contacts", only: [:new, :create]

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin' if defined? RailsAdmin
  # authenticate :user, lambda { |user| user.is_admin? } do
  #   mount Blazer::Engine, at: "blazer"
  # end
  # Static pages
  match '/error' => 'pages#error', via: [:get, :post], as: 'error_page'
  get '/terms' => 'pages#terms', as: 'terms'
  get '/privacy' => 'pages#privacy', as: 'privacy'
  get '/home' => 'users#show', as: 'user_home'
  get '/about' => 'pages#about', as: 'about'

  # OAuth
  oauth_prefix = Rails.application.config.auth.omniauth.path_prefix
  get "#{oauth_prefix}/:provider/callback" => 'users/oauth#create'
  get "#{oauth_prefix}/failure" => 'users/oauth#failure'
  get "#{oauth_prefix}/:provider" => 'users/oauth#passthru', as: 'provider_auth'
  get oauth_prefix => redirect("#{oauth_prefix}/login")

  # Devise
  devise_prefix = Rails.application.config.auth.devise.path_prefix
  devise_for :users, path: devise_prefix,
    controllers: {registrations: 'users/registrations', sessions: 'users/sessions',
      passwords: 'users/passwords', confirmations: 'users/confirmations', unlocks: 'users/unlocks'},
    path_names: {sign_up: 'signup', sign_in: 'login', sign_out: 'logout'}
  devise_scope :user do
    get "#{devise_prefix}/after" => 'users/registrations#after_auth', as: 'user_root'
  end
  get devise_prefix => redirect('/a/signup')

  # User
  resources :users, path: 'u', only: :show do
    resources :authentications, path: 'accounts'
  end

  get '/account/verification/:id' => 'accounts#verification', as: 'verification'
  get '/account/verification_code/:id' => 'accounts#verification_code', as: 'verification_code'
  get '/account/is_receiving/:id' => 'accounts#is_receiving', as: 'is_receiving'

  post '/update_information' => 'accounts#update_information', as: 'update_account_information'
  get '/get_started' => 'prompts#get_started', as: 'get_started'
  get '/setup_account' => 'users#setup_account', as: 'setup_account'
  get '/account/information' => 'accounts#new_information', as: 'new_information'

  # Dummy preview pages for testing.
  get '/p/test' => 'pages#test', as: 'test'
  get '/p/email' => 'pages#email' if ENV['ALLOW_EMAIL_PREVIEW'].present?

  get 'robots.:format' => 'robots#index'
  root 'pages#home'
end
