class ApplicationController < ActionController::Base
  before_action :authenticate_user!#, :verify_authenticity_token, only: :google#_oauth2
end
