PairSeed::Application.routes.draw do

  resources :organizations, :only => :show

  devise_for :users

  root :to => "topics#theirs"

  get 'pairfeed' => 'pages#pairfeed', :as => :pairfeed

  get 'organizations/:id' => 'organizations#show', :as => :organizations

  post 'organizations/:organization_id/join' => 'memberships#create', :as => :memberships

  resources :topics, :only => [:show, :new, :index, :create, :edit, :update, :destroy] do
    get :theirs, :on => :collection, :as => :their
  end 

  resources :offers, :only => [:index, :create]

  get '/offers/accept' => "offers#accept", :as => :accept_offer

  resources :appointments, :only => :index do
    get :cancel, :on => :member
  end

  resources :screenshares, :only => [:create, :show]
  
end
