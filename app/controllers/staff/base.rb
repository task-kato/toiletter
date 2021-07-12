class Staff::Base < ApplicationController

  private def current_staff
    @current_staff ||= Staff.find_by(id: session[:staff_id]) if session[:staff_id]
  end

  private def current_staff_is_admin
    current_staff.admin if current_staff
  end

  helper_method :current_staff, :current_staff_is_admin

end
