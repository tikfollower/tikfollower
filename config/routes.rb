Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: :index do
        post :guest_sign_in, on: :collection
        post :add_subscription_info, on: :collection
      end
      resources :subscriptions, only: :index
    end
  end
end
