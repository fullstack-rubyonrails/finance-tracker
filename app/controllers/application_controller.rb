class ApplicationController < ActionController::Base
  # Below line will pop-up login page
  before_action :authenticate_user!
  # End of Below line will pop-up login page
end
