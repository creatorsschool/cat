class CreateMember < ActiveRecord::Migration
  def change
  	create_table :members do |t|
  		t.string :name
  		t.boolean :preferencies #day:true night:false
  		t.boolean :status	#available:true unavailable:false
  		t.string :email
  		t.string :photo
  		t.integer :project_id
  		t.integer :category_id
  	end
  end
end
