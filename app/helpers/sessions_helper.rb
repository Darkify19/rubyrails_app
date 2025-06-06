module SessionsHelper
     # Logs in the given user.
 def log_in(user)
    session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
        end
        end

        def logged_in?
            !current_user.nil?
            end

            def log_out
                session.delete(:user_id)
                @current_user = nil
                end
# Returns true if the given user is the current user.
def current_user?(user)
    user && user == current_user
    end
end
