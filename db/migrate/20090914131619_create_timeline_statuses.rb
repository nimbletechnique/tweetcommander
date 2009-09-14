class CreateTimelineStatuses < ActiveRecord::Migration
  def self.up
    create_table :timeline_statuses do |t|
      t.integer :user_id
      t.integer :status_id
      t.timestamps
    end
  end

  def self.down
    drop_table :timeline_tweets
  end
end
