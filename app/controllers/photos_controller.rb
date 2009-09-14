class PhotosController < ApplicationController
  
  def index
    if logged_in?
      respond_to do |format|
        format.html do
          @tweets = current_user.seen_tweets
        end
        format.js do
          current_user.fetch_statuses
          @tweets = current_user.seen_tweets
          render :update do |page|
            page["tweets"].replace_html :partial => "tweet", :collection => @tweets
          end
        end
      end
    end
  end
  
  private
  
end
