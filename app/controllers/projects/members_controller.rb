class Projects::MembersController < ApplicationController
  def new
    binding.pry
    new_members = Member.where(id: params[:member][:id])
    project = Project.find(params[:project_id])
    new_members.update_all(project_id: project.id) 
    members = project.members 
    render json: { project: project, members: members}
  end

  def destroy   
    Project.find(params[:project_id]).members.delete(Member.find(params[:id]))
    redirect_to project_path(params[:project_id])
  end
end