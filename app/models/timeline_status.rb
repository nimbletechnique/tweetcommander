# == Schema Information
#
# Table name: timeline_statuses
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  status_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class TimelineStatus < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :status
  
  validates_presence_of :user
  validates_presence_of :status
  
end
