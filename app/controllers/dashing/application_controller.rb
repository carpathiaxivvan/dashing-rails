module Dashing
  class ApplicationController < ActionController::Base
    before_filter :authentication_with_devise
    before_action :user_authorized?

    rescue_from Octokit::NotFound, with: :force_sign_out

    private
    def user_authorized?
      token = session[:token]
      return redirect_to "https://coupa-release.herokuapp.com/authorization" if token.nil?
    end


    protected
    def force_sign_out
      redirect_to "https://coupa-release.herokuapp.com/authorization"
    end


    private

    def authentication_with_devise
      Dashing.config.devise_allowed_models.each do |model|
        self.send("authenticate_#{model.to_s}!")
      end
    end

    def check_accessibility
      auth_token = params.delete(:auth_token)
      if !Dashing.config.auth_token || auth_token == Dashing.config.auth_token
        true
      else
        render nothing: true, status: 401 and return
      end
    end
  end
end
