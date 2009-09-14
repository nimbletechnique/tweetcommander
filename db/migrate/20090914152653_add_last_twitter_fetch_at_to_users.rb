class AddLastTwitterFetchAtToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.timestamp :last_twitter_fetch_at
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :last_twitter_fetch_at
    end
  end
end
