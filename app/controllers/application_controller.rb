class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :verify_user
  before_action :set_user

  private

  def set_user
  	@user = current_user
  end
end
