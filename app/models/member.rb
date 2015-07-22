class Member < ActiveRecord::Base	
	belongs_to :category
	belongs_to :project
	has_many :member_skills 
	has_many :skills, through: :member_skills
end