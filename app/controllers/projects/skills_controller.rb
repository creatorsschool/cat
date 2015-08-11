class Projects::SkillsController < ApplicationController
  def new  
    new_skills = Skill.where(id: params[:skill][:id])
    project = Project.find(params[:project_id])
    project.skills << new_skills
    skills = project.skills 
    binding.pry 
    render json: { project: project, skills: skills}
  end

  def destroy   
    Project.find(params[:project_id]).skills.delete(Skill.find(params[:id]))
    redirect_to project_path(params[:project_id])
  end
end