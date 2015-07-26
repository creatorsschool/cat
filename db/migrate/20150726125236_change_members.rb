class ChangeMembers < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.boolean :preferencies  #day:true night:false
      t.boolean :status        #available:true unavailable:false
      t.string :email
      t.integer :project_id
    end
  end
end
