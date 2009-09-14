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

require 'test_helper'

class TimelineStatusTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
