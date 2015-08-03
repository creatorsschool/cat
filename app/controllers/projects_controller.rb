class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @skills = Skill.all
  end

  def new
    @project = Project.new
    @skills = Skill.all  
  end

  def create
    @project = Project.create(project_params)
    skill_ids = params[:project][:skill_ids]
    
    @project.skills << Skill.where(id: skill_ids)
    # Skill.where(id: skill_ids).each do |skill|
    #   skill.projects << @project
    # end
    redirect_to project_select_members_path(@project.id)
  end

  def select_members   
    @project = Project.find(params[:project_id])
    @members_filter = MemberSkill.where(skill: @project.skills).map do |member_skill|
      member_skill.member
    end
    render "select_members"
  end

  def update_members   
    member_ids = params[:project][:member_ids]
    Member.where(id: member_ids).each do |member|  
      member.update(project: @project)
      #member.porject_id = @project.id
      #member.save
    end
    
    redirect_to projects_path
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
    @members = @project.members
    binding.pry
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path
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
    params.require(:project).permit(:name, :description)
    # same as:
    #name: params[:project][:name], 
    #description: params[:descritpion], 
    #beginning: params[:beginning], 
    #duration: params[:duration]
  end

end
