Rails.application.routes.draw do
 resources :members 
 resources :projects 
 resources :skills
end
#       Prefix Verb   URI Pattern                  Controller#Action
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
#       skills GET    /skills(.:format)            skills#index
#              POST   /skills(.:format)            skills#create
#    new_skill GET    /skills/new(.:format)        skills#new
#   edit_skill GET    /skills/:id/edit(.:format)   skills#edit
#        skill GET    /skills/:id(.:format)        skills#show
#              PATCH  /skills/:id(.:format)        skills#update
#              PUT    /skills/:id(.:format)        skills#update
#              DELETE /skills/:id(.:format)        skills#destroy
