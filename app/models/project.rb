class Project < ActiveRecord::Base
   attr_accessible :name, :hashtag
   validates_presence_of :user
   
   belongs_to :user
   
   scope :joined_project,  lambda{where(:user_id => User.current_user.id)}
end
