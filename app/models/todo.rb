class Todo < ActiveRecord::Base
  attr_accessible :done, :task, :project_id
  
  belongs_to :project
end
