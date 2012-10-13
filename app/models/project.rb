class Project < ActiveRecord::Base
   attr_accessible :name, :hashtag, :latitude, :longitude
   validates_presence_of :owner
   
   belongs_to :owner
   has_and_belongs_to_many :user
   
   scope :joined_project,  lambda{where(:user_id => User.current_user.id)}
end
