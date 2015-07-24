class MemberSkill < ActiveRecord::Base
	belongs_to :members 
	belongs_to :skills 
end