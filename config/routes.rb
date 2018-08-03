Rails.application.routes.draw do
  root 'home#index'

  resources :contact_messages
end
