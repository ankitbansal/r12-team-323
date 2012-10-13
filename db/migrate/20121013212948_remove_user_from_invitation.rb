class RemoveUserFromInvitation < ActiveRecord::Migration
  def up
    remove_column :invitations, :user_id
    remove_column :invitations, :invited_by_id
  end

  def down
    add_column :invitations, :user_id, :string
    add_column :invitations, :invited_by_id, :string
  end
end
