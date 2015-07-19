class CreateUser < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :password
  		t.integer :category_id
  	end
  end
end
