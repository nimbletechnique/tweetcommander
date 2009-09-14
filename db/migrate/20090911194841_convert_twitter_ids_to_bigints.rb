class ConvertTwitterIdsToBigints < ActiveRecord::Migration
  def self.up
    change_column :users, :twitter_id, :bigint 
    change_column :statuses, :twitter_id, :bigint 
  end

  def self.down
    change_column :users, :twitter_id, :integer
    change_column :statuses, :twitter_id, :integer 
  end
end
