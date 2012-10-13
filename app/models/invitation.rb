class Invitation < ActiveRecord::Base
  attr_accessible :fb_id, :project
  belongs_to :project
end
