class ChangeProjectTimestamps < ActiveRecord::Migration
  def change
    remove_column :projects,:begining
    add_timestamps(:projects)
  end
end
