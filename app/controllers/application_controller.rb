class ApplicationController < ActionController::Base 
    before_action :authenticate_member!
    skip_before_action :verify_authenticity_token
end
