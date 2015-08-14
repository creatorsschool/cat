class ChangeProjectTimestamps < ActiveRecord::Migration
  def change
    remove_column :projects, :beginning
    add_timestamps(:projects)
  end
end
