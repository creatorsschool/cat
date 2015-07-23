
get "/member" do
erb :index
end

get "/member/list" do
	@members = Member.all 
	erb :"member/list"
end

get "/member/:id/remove" do
	@member = Member.find(params[:id]).destroy
redirect "/member/list"
end


get "/member/search" do
	if params[:name].downcase && params[:name] != ""
		@members = Member.where("name LIKE ?", "%#{params[:name]}%")
	 erb :"member/list"
	else
		"Sorry, no matches found"
	end
end

