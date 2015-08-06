class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
    @skills = Skill.all
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to members_path
    else
      @skills = Skill.all
      flash[:error] = "Sorry, you need to select skills"
      render :new
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

  

  def show
  end

  private

  def member_params
    dayshift = params[:member][:dayshift] == "day"
    available = params[:member][:available] == "on"
    params.require(:member)
      .permit(:name, :email, :project_id, skill_ids: [])
      .merge(dayshift: dayshift, availability: available)
  end
end