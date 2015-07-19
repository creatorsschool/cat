class Member < ActiveRecord::Base	
	belongs_to :category
	belongs_to :project
	has_many :member_skills
end