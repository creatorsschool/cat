class MembersController < ApplicationController
  def index
<<<<<<< HEAD
    @members = Member.all
    @skills = Skill.all
  end

  def new
    @member = Member.new
    @skills = Skill.all
  end

  def create
    #check if available
    available = if params[:available] == "on" then true else false end
    #check if dayshift is day
    dayshift = if params[:dayshift] == "day" then true else false end
    #creates member/skill/memberskill only if skills are selected
    if params[:skills]
      skills = params[:skills]
      member = Member.create(
        name: params[:name],
        email: params[:email],
        dayshift: dayshift,
        availability: available
      )
      skills.each do |skill|
        MemberSkill.create(skill_id: skill, member_id: member.id )
      end
    else
      flash[:error] = "Sorry, you need to select skills"
      redirect_to members_path
    end
  end

  def edit
    @member = Member.find(params[:id])
    @skills = Skill.all
  end

  def update
    Member.find(params[:id]).update(member_params)
    redirect_to members_path
  end

  def destroy
    Member.find(params[:id]).destroy
    redirect_to members_path
  end

  def search
    if params[:name] && params[:name] != ""
      @members = Member.where("name LIKE ?", "#{params[:name]}%")
    else  
      @members = Member.all
    end

    if @members == []
      flash[:error] = "Sorry no matches found for your search"          
    end
    redirect_to members_path  
  end

  def show
  end

  private

  def member_params
    params.require(:member).permit(:name, :dayshift, :availability, :email, :project_id)
=======
    
>>>>>>> pm-cat-on-rails
  end
end