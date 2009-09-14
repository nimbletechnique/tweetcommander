# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def is_on_first_page_of_tweets?
    params[:page].blank? || params[:page] == "1"
  end
  
end
