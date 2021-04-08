class ApplicationController < ActionController::Base
  before_action :verify_authenticity_token, only: :google_oauth2
  # before_action :authenticate_user!
end
