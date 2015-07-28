class CreateForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key :members, :projects
    add_foreign_key :member_skills, :members
    add_foreign_key :member_skills, :skills
    add_foreign_key :project_skills, :projects
    add_foreign_key :project_skills, :skills
  end
end
