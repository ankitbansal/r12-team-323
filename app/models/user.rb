class User < ActiveRecord::Base
  attr_accessible :provider, :uid
  has_and_belongs_to_many :projects
  has_many :project_users, :class_name => "ProjectUser", :table_name => "projects_users"
  # attr_accessible :title, :body
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  
end
