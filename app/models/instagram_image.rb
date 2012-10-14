require 'net/http'

class InstagramImage
  attr_accessor :attribution, :tags, :location, :comments, :filter, :created_time, :link, :likes, :images, :caption, :type, :id, :user

  def initialize hash
    self.attribution = hash["attribution"]
    self.tags = hash["tags"]
    self.location = hash["location"]
    self.comments = hash["comments"]
    self.filter = hash["filter"]
    self.created_time = hash["created_time"]
    self.link = hash["link"]
    self.likes = hash["likes"]
    self.images = hash["images"]
    self.caption = hash["caption"]
    self.type = hash["type"]
    self.id = hash["id"]
    self.user = hash["user"]
  end

  def self.access_token
    "a6609166c9224bd4aa93b5e6ce40ad32"
  end

  def self.find_by_tag_url tag
    "https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=#{access_token}"
  end

  def self.find_by_tag(tag)
    tag = tag.sub('#', "")
    JSON.parse(HTTParty.get(find_by_tag_url(tag)).body)["data"].collect { |json|
      InstagramImage.new json
    }
  end

  def standard_url
    if images
      if images['standard_resolution']
        if images['standard_resolution']['url']
          return images['standard_resolution']['url']
        end
      end
    end
  end

  def thumbnail_url
    if images and images['thumbnail'] and images['thumbnail']['url']
      return images['thumbnail']['url']
    end
  end

  def caption_text
    if caption and caption['text']
      return caption['text']
    end
  end
end
