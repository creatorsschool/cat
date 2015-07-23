get "/" do 
	erb :index
end

get "/member" do

	erb :"/member/index"

end

get "/member/create" do 

erb :"/member/create" 
end