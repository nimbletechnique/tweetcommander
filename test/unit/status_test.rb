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

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
