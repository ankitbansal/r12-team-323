class ProjectUser < ActiveRecord::Base
  self.table_name = "projects_users"
  attr_accessible :reached
  
  belongs_to :project
  belongs_to :user
  
  def update_reached_flag value
    st = ActiveRecord::Base.connection.raw_connection.prepare("update projects_users set reached=? where project_id=? and user_id=?")
    st.execute(1, self.project.id, self.user.id)
    st.close
  end
end