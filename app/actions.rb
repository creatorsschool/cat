
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

