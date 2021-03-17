class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in? 

    def current_user    
      User.find_by(id: session[:user_id])  
    end

    def logged_in? 
      !current_user.nil?  
    end

    # Catch all CanCan errors and alert the user of the exception
    rescue_from CanCan::AccessDenied do | exception |
      redirect_to root_url, alert: exception.message
    end
    
end
