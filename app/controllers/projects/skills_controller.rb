class Projects::SkillsController < ApplicationController
  def new    
    skill = Skill.find_by name: params[:name]
    if skill
      Project.find(params[:project_id]).skills << skill
    else
      Project.find(params[:project_id]).skills << Skill.create(name: params[:name])
    end
    project = Project.find(params[:project_id])
    new_skill = project.skills.last        
    render json: { project: project, new_skill: new_skill}
  end

  def destroy   
    Project.find(params[:project_id]).skills.delete(Skill.find(params[:id]))
    redirect_to project_path(params[:project_id])
  end
end