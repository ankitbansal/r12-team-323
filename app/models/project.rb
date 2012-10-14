class Project < ActiveRecord::Base
   attr_accessible :name, :hashtag, :latitude, :longitude, :invitations, :project_date
   validates_presence_of :owner

   belongs_to :owner, :class_name => "User"
   has_many :todos
   
   has_and_belongs_to_many :users
   has_many :project_users, :class_name => "ProjectUser", :table_name => "projects_users"
   
   has_many :invitations
   acts_as_commentable

   scope :joined_project,  lambda{where(:user_id => User.current_user.id)}
end
