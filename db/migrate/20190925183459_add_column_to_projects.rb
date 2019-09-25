class AddColumnToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :deleted_at, :datetime
  end
end
