class Staff::Base < ApplicationController

    private def current_staff
        @current_staff ||= Staff.find_by(id: session[:staff_id]) if session[:staff_id]
    end 

    helper_method :current_staff 
    

end