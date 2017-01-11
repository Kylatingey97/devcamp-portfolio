class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
end
  
  before_action :set_source

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end