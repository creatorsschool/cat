
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