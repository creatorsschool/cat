class Skill < ActiveRecord::Base
	has_many :member_skills 
	has_many :members, through: :member_skills
  has_many :project_skills 
  has_many :projects, through: :project_skills
  validates_uniqueness_of :name
end