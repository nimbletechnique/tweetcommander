class PhotosController < ApplicationController
  
  def index
    if logged_in?
      respond_to do |format|
        format.html do
          @tweets = user_seen_tweets
        end
        format.js do
          current_user.fetch_statuses
          @tweets = user_seen_tweets
          render :update do |page|
            page["tweets"].replace_html :partial => "tweets", :object => @tweets
          end
        end
      end
    end
  end
  
  private
  
  def user_seen_tweets
    current_user.seen_tweets.paginate :page => params[:page], :per_page => 100
  end
  
end
