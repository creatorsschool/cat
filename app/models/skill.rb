class Skill < ActiveRecord::Base
	has_many :requirements
end