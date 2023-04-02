class ApplicationController < ActionController::Base

#before_action :authenticate_customer!, except: [:top,:about]
# before_action :is_matching_login_customer, only: [:edit, :update]
#  before_action :configure_permitted_parameters, if: :devise_controller?
 # userではなくcustomer?

   def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
      root_path
    end
   end
end
