class Project < ActiveRecord::Base
   attr_accessible :name, :hashtag
   validates_presence_of :user
   
   belongs_to :user
end
