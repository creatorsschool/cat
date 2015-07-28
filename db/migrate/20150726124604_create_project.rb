class CreateProject < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.datetime :beginning
      t.integer :duration
    end
  end
end
