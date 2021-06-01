class ApplicationController < ActionController::Base
  @@url = "https://api.rawg.io/api"
  @@key = "?key=0895c28de6834c4498868d10c986b87b"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    User.find(session[:user_id])
  end
  def require_login
    if !session.include? :user_id
      redirect_to root_path
    end
  end
end
