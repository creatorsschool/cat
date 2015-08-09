class Projects::MembersController < ApplicationController
  def new
    Member.create(
      name: params[:name],
      email: params[:email],
      dayshift: params[:dayshift] == "day",
      availability: params[:availability] == "true",
      project_id: params[:project_id])

    project = Project.find(params[:project_id])
    new_member = project.members.last
    render json: { project: project, new_member: new_member}
  end

  def destroy   
    Project.find(params[:project_id]).members.delete(Member.find(params[:id]))
    redirect_to project_path(params[:project_id])
  end
end