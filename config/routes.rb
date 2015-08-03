Rails.application.routes.draw do
  root to: 'home#index'

  get '/projects/search', to: 'projects#search', as: :search_projects
  get '/members/search', to: 'members#search', as: :search_members
  
  resources :members
  resources :projects do
    get :select_members
    put :update_members
  end

  #get '/projects/:id/select_members', to: 'projects#show_members', as: :projects_show_members
  #get '/projects/skills_submit', to: 'projects#skills_submit', as: :projects_skills_submit


end
# # Prefix Verb   URI Pattern                                    Controller#Action
#                   root GET    /                                              home#index
#                members GET    /members(.:format)                             members#index
#                        POST   /members(.:format)                             members#create
#             new_member GET    /members/new(.:format)                         members#new
#            edit_member GET    /members/:id/edit(.:format)                    members#edit
#                 member GET    /members/:id(.:format)                         members#show
#                        PATCH  /members/:id(.:format)                         members#update
#                        PUT    /members/:id(.:format)                         members#update
#                        DELETE /members/:id(.:format)                         members#destroy
# project_select_members GET    /projects/:project_id/select_members(.:format) projects#select_members
# project_update_members PUT    /projects/:project_id/update_members(.:format) projects#update_members
#               projects GET    /projects(.:format)                            projects#index
#                        POST   /projects(.:format)                            projects#create
#            new_project GET    /projects/new(.:format)                        projects#new
#           edit_project GET    /projects/:id/edit(.:format)                   projects#edit
#                project GET    /projects/:id(.:format)                        projects#show
#                        PATCH  /projects/:id(.:format)                        projects#update
#                        PUT    /projects/:id(.:format)                        projects#update
#                        DELETE /projects/:id(.:format)                        projects#destroy
#        search_projects GET    /projects/search(.:format)                     projects#search
#         search_members GET    /members/search(.:format)                      members#search

