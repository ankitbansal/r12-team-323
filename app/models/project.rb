class Project < ActiveRecord::Base
   attr_accessible :name, :hashtag, :latitude, :longitude, :invitations
   validates_presence_of :owner

   belongs_to :owner, :class_name => "User"
   has_and_belongs_to_many :user
   has_many :todos
   
   has_many :invitations
   acts_as_commentable

   scope :joined_project,  lambda{where(:user_id => User.current_user.id)}
end
