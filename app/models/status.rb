# == Schema Information
#
# Table name: statuses
#
#  id                 :integer         not null, primary key
#  twitter_id         :integer(8)
#  body               :text
#  source             :string(255)
#  truncated          :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  twitter_created_at :datetime
#

class Status < ActiveRecord::Base
  include TwitterModel
 
  belongs_to :user
 
  def self.from_xml(xml)
    twitter_id = xml.at("id").content.to_i
    status = Status.find_by_twitter_id(twitter_id)
    if status
      logger.debug "Found existing status: #{status}"
    else
      user = User.from_xml(xml.at("user"))
      status = Status.new do |status|
        status.twitter_id = xml.at("id").content
        status.body = xml.at("text").content
        status.source = xml.at("source").content
        status.truncated = xml.at("truncated").content
        status.twitter_created_at = xml.at("created_at").content
        status.user_id = user.id
      end
      status.save
      logger.debug "Created new status: #{status}"
    end
    status
  end
  
end
