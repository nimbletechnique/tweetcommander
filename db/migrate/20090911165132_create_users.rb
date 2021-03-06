class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :twitter_id
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :description
      t.string :profile_image_url
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
