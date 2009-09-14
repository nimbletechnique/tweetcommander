class AddTwitterCreatedAtToStatuses < ActiveRecord::Migration
  def self.up
    change_table :statuses do |t|
      t.timestamp :twitter_created_at
    end
  end

  def self.down
    change_table :statuses do |t|
      t.remove :twitter_created_at
    end
  end
end
