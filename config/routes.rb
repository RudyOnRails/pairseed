PairSeed::Application.routes.draw do

  resources :organizations

  devise_for :users

  root :to => 'pages#topic_feed'

  get 'pairfeed' => 'pages#pairfeed', :as => :pairfeed

  get 'organizations/:id' => 'organizations#show', :as => :organizations

  post 'organizations/:organization_id/join' => 'organization_memberships#create', :as => :organization_memberships

  resources :pair_topics, :only => [:show, :new, :index, :create, :edit, :update, :destroy]
  resources :pair_proposals, :only => [:index, :create]
  
end
