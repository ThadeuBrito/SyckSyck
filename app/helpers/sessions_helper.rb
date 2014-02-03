module SessionsHelper
  protected
    def store_cookie_user_type
      cookies[:user_type] = { :value => current_usuario.class.to_s.downcase, :expires => 1.month.from_now }
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_stored_location
      session[:return_to] = nil
    end
end
