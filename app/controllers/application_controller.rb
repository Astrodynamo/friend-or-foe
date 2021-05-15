class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        @user ||= User.find_by(id: params[:id])
    end

    def logged_in?
        !!current_user
    end
end
