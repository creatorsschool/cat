class CreateProject < ActiveRecord::Migration
  def change
  	create_table :projects do |t|
  		t.string :title
  		t.string :descripltion
  		t.datetime :begining
  		t.integer :duration
  		t.integer :user_id
  	end
  end
end
