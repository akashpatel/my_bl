MyBl::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => "home#index"

  match '/user_bucket_lists/find_matches' => 'user_bucket_lists#find_matches', :as => :find_matches
  match '/user_bucket_lists/send_invite' => 'user_bucket_lists#send_invite', :as => :send_invite
  match '/bucket_list_tags/search' => 'bucket_list_tags#search', :as => :search_bucket_list_tags

  devise_for :users

  resources :user_profiles
  resources :user_bucket_lists
  resources :authentications

  get "home/index"

  root :to => "home#index"
end
