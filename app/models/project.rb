class Project < ActiveRecord::Base 
  has_many :project_skills 
  has_many :skills, through: :project_skills
  has_many :member_skills 
	has_many :members, through: :member_skills

end