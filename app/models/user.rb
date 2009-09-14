# == Schema Information
#
# Table name: users
#
#  id                    :integer         not null, primary key
#  twitter_id            :integer(8)
#  name                  :string(255)
#  screen_name           :string(255)
#  location              :string(255)
#  description           :string(255)
#  profile_image_url     :string(255)
#  url                   :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  access_token          :string(255)
#  access_token_secret   :string(255)
#  last_twitter_fetch_at :datetime
#

class User < ActiveRecord::Base
  
  include TwitterModel
  
  has_many :statuses, :dependent => :destroy
  has_many :timeline_statuses, :dependent => :destroy
  has_many :seen_tweets, :class_name => "Status", :through => :timeline_statuses, :source => :status, :order => "twitter_created_at DESC"
  
  def self.from_xml(xml)
    twitter_id = xml.at("id").content.to_i
    user = User.find_by_twitter_id(twitter_id)
    if user
      logger.debug "Found existing user: #{user}"
    else
      user = User.new do |user|
        user.twitter_id = twitter_id
        user.name = xml.at("name").content
        user.screen_name = xml.at("screen_name").content
        user.location = xml.at("location").content
        user.description = xml.at("description").content
        user.profile_image_url = xml.at("profile_image_url").content
        user.url = xml.at("url").content
      end
      user.save
      logger.debug "Created new user: #{user}"
    end
    user
  end

  def can_fetch_more_tweets?
    last_twitter_fetch_at.nil? || last_twitter_fetch_at < Time.now.utc - 60.seconds
  end

  def fetch_statuses
    twitter.fetch_tweets.each do |status|
      unless seen_tweets.find(:first, :conditions => { :twitter_id => status.twitter_id } )
        seen_tweets << status
      end
    end
    update_attribute :last_twitter_fetch_at, Time.now
  end

  def set_access_token(token)
    update_attributes :access_token => token.token, :access_token_secret => token.secret
  end
  
  private
  
  def twitter
    @twitter ||= Proc.new do
      twitter_access = OAuth::AccessToken.new Twitter.oauth_consumer, access_token, access_token_secret
      Twitter.new(twitter_access, twitter_id)
    end.call
  end
  
end
