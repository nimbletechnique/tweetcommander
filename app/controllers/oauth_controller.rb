class OauthController < ApplicationController
  
  skip_before_filter :ensure_authorized

  def logout
    reset_session
    redirect_to root_path
  end
  
  def login
    token = Twitter.get_request_token oauth_url
    store_request_token(token)
    redirect_to token.authorize_url
  end

  # callback URL for twitter oauth. get an access token and store into the session
  def authorize
    logout and return if params[:denied]

    request_token = load_request_token
    access_token = request_token.get_access_token :oauth_verifier => params[:oauth_verifier]
    
    self.current_user = Twitter.new(access_token, access_token.params[:user_id]).user
    current_user.set_access_token access_token
    
    redirect_to root_path
  end
  
  private
  
  def load_request_token
    Twitter.build_request_token session[:request_token], session[:request_token_secret]
  end
  
  def store_request_token(token)
    session[:request_token] = token.token
    session[:request_token_secret] = token.secret
  end
  
end
