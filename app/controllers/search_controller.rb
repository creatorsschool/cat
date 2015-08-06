class SearchController < ApplicationController
  def search
    if params[:name] && params[:name] != ""
      @members = Member.where("name LIKE ?", "#{params[:name]}%")
    else  
      @members = Member.all
    end

    if @members == []
      render json: "Sorry no matches found for your search", status: 404
    else 
      render json: @members.map { |member|
        member.attributes.merge(working_hours: member.working_hours, skills: member.skills) 
      }        
    end 
  end
end
