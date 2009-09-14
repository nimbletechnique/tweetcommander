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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
