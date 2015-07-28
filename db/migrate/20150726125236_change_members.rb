class ChangeMembers < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.boolean :dayshift  #day:true night:false
      t.boolean :availability        #available:true unavailable:false
      t.string :email
      t.integer :project_id
    end
  end
end
