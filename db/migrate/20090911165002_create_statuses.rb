class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.integer :twitter_id
      t.text :body
      t.string :source
      t.boolean :truncated
      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
