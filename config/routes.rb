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
