class Project < ActiveRecord::Base	
	belongs_to :user
	has_many :requirements
	has_many :members
end