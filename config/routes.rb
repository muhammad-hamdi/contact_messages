Rails.application.routes.draw do
  root 'home#index'

  resources :contact_messages

  namespace :api do
    resources :contact_messages, except: [:new, :edit]
  end
end
