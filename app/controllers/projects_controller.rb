class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @skills = Skill.all
  end

  def new
    @project = Project.new
    @skills = Skill.all  
    @members_filter = Member.all
  end

  def create
    @project = Project.create(project_params)
    skill_ids = params[:project][:skill_ids]
    
    @project.skills << Skill.where(id: skill_ids)

    member_ids = params[:project][:member_ids]
    Member.where(id: member_ids).update_all(project_id: @project.id)
    redirect_to projects_path
    
  end

  def select_members  
    @members_filter = MemberSkill.where(skill_id: params[:project][:skill_ids]).map do |member_skill|
      member_skill.member
    end
    @members_filter = @members_filter.uniq { |x| x.name }
    render json: {members: @members_filter }
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    Project.find(params[:id]).update(project_params)
    redirect_to project_path(params[:id])
  end

  def show
    @project = Project.find(params[:id])
    @skills = @project.skills
    @skills_left = Skill.where.not(id: @skills.map(&:id))
    @members = @project.members
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path
  end

  def search

    # Skill.where.not(id: skills.map(&:id))
    # if params[:name] && params[:name] != ""
    #   @projects = Project.where("name LIKE ?", "#{params[:name]}%")
    # else
    #   @projects = Project.all
    # end

    # if @projects == []
    #   flash[:error] = "Sorry no matches found for your search"
    # end
    if !params[:search].blank?
      @projects = Project.where('name LIKE ?', "%#{params[:search]}%")
    else
      @projects = Project.all
    end
    render json: {projects: @projects}

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
