module Sinatra
  module Authentication
    def require_user_login
      halt(401) if session[:current_user].nil?
    end

    def require_admin_login
      require_user_login
      halt(401) unless session[:current_user].admin?
    end
  end

  helpers Authentication
end
