Rails.application.routes.draw do


# 顧客用 
  devise_for :customers, skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# 管理者用
 devise_for :admin,skip: [:registrations, :passwords] , controllers: {
     sessions: "admin/sessions"
   }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: "homes#top" 
    
    get "/about" =>"homes#about",as: 'about'
    get "/customers/mypage" =>"customers#mypage",as: 'mypage'
    get "/customers/information/edit" =>"customers#edit",as: 'edit'
    patch "/customers/information" =>"customers#update",as: 'update'
    get "customers/unsubscribe" => "customers#unsubscribe",as: 'unsubscribe'
    patch "customers/withdrawal" => "customers#withdrawal",as: 'withdrawal'
    resources :addresses
    resources :orders, only: [:show, :index, :new, :create]
    post "/orders/confirm" =>"orders#confirm",as: 'confirm'
    post "/orders/thanks" =>"orders#thanks",as: 'show'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items

  end

    get '/admin' => "admin/homes#top"
  namespace :admin do
    resources :items
    resources :customers
    resources :homes
    resources :genres
    resources :oeders
    resources :oeders_details
  end

end
