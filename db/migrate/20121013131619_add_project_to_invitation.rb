class AddProjectToInvitation < ActiveRecord::Migration
  
  def change
    change_table :invitations do |t|
      t.references :project
    end
  end
end
