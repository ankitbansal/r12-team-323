class RenameUserToOwnerForProject < ActiveRecord::Migration
  def change
    rename_column :projects, :user_id, :owner_id
  end
end
