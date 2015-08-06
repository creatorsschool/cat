class Member < ActiveRecord::Base	
	has_many :member_skills, class_name: :MemberSkill, dependent: :destroy
	has_many :skills, through: :member_skills
  belongs_to :project
  mount_uploader :avatar, AvatarUploader

  def working_hours
    if dayshift
      "Day"
    else
      "Night"
    end
  end

  def availability_representation
    if availability
      "Available"
    else
      "Unavailable"
    end
  end
end