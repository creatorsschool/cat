class CreateRequirements < ActiveRecord::Migration
  def change
  	create_table :requirements do |t|
  		t.integer :project_id
  		t.integer :skill_id
  	end
  end
end
