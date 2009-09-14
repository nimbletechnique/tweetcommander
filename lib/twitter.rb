require 'nokogiri'
class Twitter
  
  def self.build_request_token(token_string, secret_string)
    OAuth::RequestToken.new oauth_consumer, token_string, secret_string
  end
  
  def self.get_request_token(callback_url)
    oauth_consumer.get_request_token :oauth_callback => callback_url
  end
  
  def self.oauth_consumer
    @consumer ||= OAuth::Consumer.new ENV["TWEETCOMMANDER_TWITTER_KEY"], 
                                      ENV["TWEETCOMMANDER_TWITTER_SECRET"], 
                                      :site => "http://twitter.com",
                                      :request_token_path => "/oauth/request_token",
                                      :access_token_path => "/oauth/access_token",
                                      :authorize_path => "/oauth/authorize"
  end
  
  def initialize(twitter_access, twitter_user_id)
    @twitter_access = twitter_access
    @twitter_user_id = twitter_user_id
  end

  def user
    logger.debug "Fetching user for id #{@twitter_user_id}"
    unless user = User.find_by_twitter_id(@twitter_user_id)
      xml = @twitter_access.get("/users/show.xml?id=#{@twitter_user_id}").body
      doc = Nokogiri::XML(xml)
      logger.debug xml
      user = User.from_xml(doc.xpath("/user").first)
    end
    user
  end
  
  # fetches statuses for the user
  def fetch_tweets(count = 200)
    logger.debug "Fetching statuses for user with twitter id: #{@twitter_user_id}"
    uri = "/statuses/friends_timeline.xml?count=#{count}"
    doc = Nokogiri::XML(@twitter_access.get(uri).body)
    statuses = doc.xpath("//status").map { |status| Status.from_xml(status) }
  end
  
  private
  
  def logger
    RAILS_DEFAULT_LOGGER
  end
  
end