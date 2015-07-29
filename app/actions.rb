
get "/" do 
	erb :index
end

get "/member/index" do
	erb :"/member/index"
end

get "/project/index" do
	erb :"/project/index"
end

get "/member/list" do
	@members = Member.all 
	erb :"/member/list"
end

get "/project/list" do 
	@projects = Project.all
	erb :"/project/list"
end

get "/member/:id/remove" do
	@member = Member.find(params[:id]).destroy
redirect "/member/list"
end

get "/project/:id/remove" do
	@project = Project.find(params[:id]).destroy
redirect "/project/list"
end

get "/member/search" do
	if params[:name] && params[:name] != ""
		@members = Member.where("name LIKE ?", "#{params[:name]}%")
	else
		@members = Member.all
	end

	if @members != []
	  erb :"/member/list"
	else
    flash[:error] = "Sorry no matches found for your search"
		redirect "/member/list"
	end
end

get "/project/search" do 
	if params[:name] && params[:name] != ""
		@projects = Project.where("name LIKE ?", "#{params[:name]}%")
	else
		@projects = Project.all
	end

	if @projects != []
	  erb :"/project/list"
	else
    flash[:error] = "Sorry no matches found for your search"
		redirect "/project/list"
	end
end

get "/member/create" do 
	@skills = Skill.all
	@members = Member.all
	erb :"/member/create"
end

get "/project/create" do
	@skills = Skill.all
	@project = Project.all
	erb :"/project/create"
end

post "/members" do
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

	end
	redirect "/member/create"
end

post "/projects" do 
	project = Project.create(name: params[:name], description: params[:descritpion], beginning: params[:beginning], duration: params[:duration])
	skills = params[:skills]
	@members_filter = skills.map do |skill|
		ProjectSkill.create(skill_id: skill, project_id: project)
		Skill.find(skill).members 
	end
	@show = Project.last
	@skills = Skill.all
	@project = Project.all
	erb :"/project/create"
end

post "skills" do 
	Skill.create(name: params[:skill])
	redirect "/member/create"
end