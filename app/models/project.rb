class Project < ActiveRecord::Base 
  has_many :project_skills, dependent: :destroy
  has_many :skills, through: :project_skills
  has_many :members, dependent: :nullify
end