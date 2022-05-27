class ApplicationController < ActionController::Base
  helper ActionText::Engine.helpers
  before_action :set_session

  private

  def set_session
    return if session[:id]

    session[:id] = SecureRandom.uuid
  end
end
