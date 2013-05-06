PairSeed::Application.routes.draw do

  resources :organizations, :only => :show

  devise_for :users

  root :to => 'pages#topic_feed'

  get 'pairfeed' => 'pages#pairfeed', :as => :pairfeed

  get 'organizations/:id' => 'organizations#show', :as => :organizations

  post 'organizations/:organization_id/join' => 'memberships#create', :as => :memberships

  resources :topics, :only => [:show, :new, :index, :create, :edit, :update, :destroy]
  resources :offers, :only => [:index, :create]
  
end
