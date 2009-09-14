class AddAccessTokenIntoUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :access_token
      t.string :access_token_secret
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :access_token
      t.remove :access_token_secret
    end
  end
end
