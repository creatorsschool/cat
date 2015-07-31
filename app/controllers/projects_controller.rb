class ProjectsController < ApplicationController
  def index
    @porjects = Project.all
    @skills = Skill.all
  end

  def new
    @project = Project.new
    @skills = Skill.all  
  end

  def create
    @project = Project.create(name: params[:name], description: params[:descritpion], beginning: params[:beginning], duration: params[:duration])
    skills = params[:skills]
    skills.each do |skill|
      ProjectSkill.create(skill_id: skill, project_id: @project.id)
      #Skill.find(skill).members 
    end
    #@skills = Skill.all

    redirect_to project_select_members_path
  end

  def select_members
    @project = Project.find(params[:project_id])
    @members_filter = MemberSkill.where(skill: @project.skills).map do |member_skill|
      member_skill.member
    end
  end

  def update_members
    members = params[:member_ids]
    members.each do |member_id|
      Member.find(member_id).update project_id: params[:project_id]
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    Project.find(params[:id]).update(project_params)
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
    @skills = Skill.all
  end

  def destroy
    Project.find(params[:id]).destroy
  end

  def search

    if params[:name] && params[:name] != ""
      @projects = Project.where("name LIKE ?", "#{params[:name]}%")
    else
      @projects = Project.all
    end

    if @projects == []
      flash[:error] = "Sorry no matches found for your search"
    end

    redirect_to projects_path

  end

  private

  def project_params
    params.require(:member).permit(:name, :descritpion, :beginning, :duration)
  end

end
