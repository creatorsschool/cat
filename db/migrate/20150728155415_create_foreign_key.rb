class CreateForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key :members, :projects
  end
end
