class CreateMemberskill < ActiveRecord::Migration
  def change
  	create_table :member_skills do |t|
  		t.integer :member_id
  		t.integer :skill_id
  	end
  end
end
