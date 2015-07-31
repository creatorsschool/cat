Rails.application.routes.draw do
 root to: 'home#index'

 resources :members 
 resources :projects 
end


#  Prefix Verb   URI Pattern                  Controller#Action
#      members GET    /members(.:format)           members#index
#              POST   /members(.:format)           members#create
#   new_member GET    /members/new(.:format)       members#new
#  edit_member GET    /members/:id/edit(.:format)  members#edit
#       member GET    /members/:id(.:format)       members#show
#              PATCH  /members/:id(.:format)       members#update
#              PUT    /members/:id(.:format)       members#update
#              DELETE /members/:id(.:format)       members#destroy
#     projects GET    /projects(.:format)          projects#index
#              POST   /projects(.:format)          projects#create
#  new_project GET    /projects/new(.:format)      projects#new
# edit_project GET    /projects/:id/edit(.:format) projects#edit
#      project GET    /projects/:id(.:format)      projects#show
#              PATCH  /projects/:id(.:format)      projects#update
#              PUT    /projects/:id(.:format)      projects#update
#              DELETE /projects/:id(.:format)      projects#destroy