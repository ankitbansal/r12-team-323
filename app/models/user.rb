class User < ActiveRecord::Base
  attr_accessible :provider, :uid
  has_and_belongs_to_many :projects
  # attr_accessible :title, :body
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  
end
