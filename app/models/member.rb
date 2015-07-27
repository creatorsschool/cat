class Member < ActiveRecord::Base	
	has_many :member_skills 
	has_many :skills, through: :member_skills
  belongs_to :project
end