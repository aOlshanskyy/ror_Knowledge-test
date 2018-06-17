Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
    root to: "pages#index"

    post "test/:test_id/check" ,to: "tests#check", as: "check"
   # post "test/:test_id/checkrand" ,to: "tests#checkrand", as: "checkrand"   
    get "test/finaly" ,to: "tests#finaly", as: "finaly"   

    resources :tests
    resources :answers 
    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
