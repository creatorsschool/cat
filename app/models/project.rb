class Project < ActiveRecord::Base 
  has_many :project_skills
  has_many :skills, through: :project_skills
  has_many :members
end