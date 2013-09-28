class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :get_all_tags
  
  protect_from_forgery with: :exception

  def get_all_tags
  	@tags = Tag.all
  end



  
end
