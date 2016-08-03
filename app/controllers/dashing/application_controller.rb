module Dashing
  class ApplicationController < ActionController::Base
    puts 'start newline2'
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts ''
    puts 'end newline2'
    before_filter :authentication_with_devise
    before_action :user_authorized?

    rescue_from Octokit::NotFound, with: :force_sign_out

    private
    def user_authorized?
      @user = session[:user]
      puts 'authorization_path'
      puts authorization_path
      return redirect_to authorization_path if @user.nil?
    end


    protected
    def force_sign_out
      redirect_to sign_out_path
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
