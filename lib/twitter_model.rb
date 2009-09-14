module TwitterModel
  
  def self.included(base)
    base.class_eval do
      validates_uniqueness_of :twitter_id
    end
  end
  
end