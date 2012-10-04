Infinityt::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get "main/index"

  root :to => 'main#index'
  resources :pages
    #get "pages/about"
    #get "pages/offers"=>"pages#show"
    #get "pages/contacts"
    #get "page/contacts"=>"pages#contacts", :as => 'contacts_page'
  resources :objects
    get "objects" => "objects#index"
  resources :plans
    get "plans/show/:id/:floor" => "plans#show", :as =>'plan_floor'
  resources :rooms
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
      get "admin/plans?object=:object" => "admin/plans#show", :as => :object_plan
      get "admin/rooms?object=:object" => "admin/rooms#show", :as => :room_description

end
