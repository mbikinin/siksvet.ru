Infinityt::Application.routes.draw do

  mount Rich::Engine => '/rich', :as => 'rich'

  get "main/index"
  resources :news, :only=>[:show]
  root :to => 'main#index'
  
  resources :pages
    #get "pages/about"
    #get "pages/offers"=>"pages#show"
    #get "pages/contacts"
    #get "page/contacts"=>"pages#contacts", :as => 'contacts_page'
  
  resources :objects
    get "objects" => "objects#index"
    get "object/:id/map" => "objects#map", :as=>:object_map
    
  resources :declarations
    get "declarations" => "declarations#index"
    get "declarations/filter/:id" => "declarations#index", :as=>"declarations_filter"
  
  resources :plans
    get "plans/show/:id/:floor" => "plans#show", :as =>'plan_floor'
  resources :rooms
  resources :photos
    get "/admin/objects/photo/:id" => "admin/objects#photo", :as => :admin_objects_photo
    get "/admin/objects/remove_photo/:id" => "photos#remove_photo", :as => :admin_objects_remove_photo
  
  get "objects/:id/photos" => "photos#object_photos", :as => :object_photos
  post '/tinymce_assets' => 'tinymce_assets#create'
  
  resources :feedbacks
    get "feedback/order" => "feedbacks#order", :as=> "feedback_order"

    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
      get "admin/plans?object=:object" => "admin/plans#show", :as => :object_plan
      get "admin/rooms?object=:object" => "admin/rooms#show", :as => :room_description

end
