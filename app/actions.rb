get "/member/list" do
	@members = Member.all 
	erb :"member/list"
end

get "/member/:id/remove" do
	@member = Member.find(params[:id]).destroy
redirect "/member/list"
end


get "/member/search" do
	if params[:name] && params[:name] != ""
		@members = Member.where("name LIKE ?", "#{params[:name]}%")

  else
    @members = Member.all
  end

  if @members != []
	  erb :"member/list"
	else
    flash[:error] = "Sorry Patrícia, no matches found for your search"
		redirect "/member"
	end
end


get "/" do 
	erb :index
end

get "/member/index" do

	erb :"/member/index"
end

get "/member/create" do 
	@skills = Skill.all
	@members = Member.all
	erb :"/member/create"
end

post "/members" do
	member = Member.create(name: params[:name])
	skills = params[:skills]
	skills.each do |skill|
		MemberSkill.create(skill_id: skill, member_id: member.id )
	end

	redirect "/member/create"
end

post "/skills" do 
	Skill.create(name: params[:skill])
	redirect "/member/create"
end

