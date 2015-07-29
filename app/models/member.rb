class Member < ActiveRecord::Base	
	has_many :member_skills, class_name: :MemberSkill 
	has_many :skills, through: :member_skills
  belongs_to :project
end