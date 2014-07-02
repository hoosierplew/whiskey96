Whiskey96::Application.routes.draw do
  root to: 'whiskeys#index'

  resources :ratings
  resources :whiskeys

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    delete 'signout', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

end
