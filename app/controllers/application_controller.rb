include CanCan::ControllerAdditions
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  ##begin
    #def after_sign_in_path_for(resource)
     # app_dashboard_index_path
    #end
end
