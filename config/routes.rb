Rails.application.routes.draw do

    root to: "pages#index"

    resources :tests
    resources :answers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
