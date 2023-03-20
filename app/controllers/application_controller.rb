class ApplicationController < ActionController::Base

    before_action :find_current_user

    helper_method :is_logged_in?

    def find_current_user
        if is_logged_in?
            @current_user = User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def check_login
        if is_logged_in?

        else
            redirect_to new_session_path
        end
    end

    def is_logged_in?
        session[:user_id].present?
    end

end