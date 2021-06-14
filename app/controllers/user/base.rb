# frozen_string_literal: true

module User
  class Base < ApplicationController
    private def current_user
      if session[:user_id]
        @current_user ||=
          User.find_by(id: session[:user_id])
      end
    end

    helper_method :current_user
  end
end
