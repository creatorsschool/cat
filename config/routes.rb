Rails.application.routes.draw do
 root to: 'home#index'

 resources :members 
 resources :projects 
end
