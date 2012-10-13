class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :user, :invited_by
      t.references :user
      
      t.timestamps
    end
  end
end
