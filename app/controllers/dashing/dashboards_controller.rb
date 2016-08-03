# module Dashing
#   class DashboardsController < ApplicationController
#     puts 'start newline2'
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts ''
#     puts 'end newline2'
#     before_action :verify_github_permission
#     before_filter :check_dashboard_name, only: :show

#     rescue_from ActionView::MissingTemplate, with: :template_not_found

#     def index
#       render file: dashboard_path(Dashing.config.default_dashboard || Dashing.first_dashboard || ''), layout: Dashing.config.dashboard_layout_path
#     end

#     def show
#       render file: dashboard_path(params[:name]), layout: Dashing.config.dashboard_layout_path
#     end

#     private

#     def check_dashboard_name
#       raise 'bad dashboard name' unless params[:name] =~ /\A[a-zA-z0-9_\-]+\z/
#     end

#     def dashboard_path(name)
#       Dashing.config.dashboards_views_path.join(name)
#     end

#     def template_not_found
#       raise "Count not find template for dashboard '#{params[:name]}'. Define your dashboard in #{dashboard_path('')}"
#     end

#     def verify_github_permission
#       client = Octokit::Client.new(:client_id => ENV['GITHUB_CLIENT_ID'], :client_secret => ENV['GITHUB_CLIENT_SECRET'])
#       puts "before nil***********"
#       puts @user.nil?
#       puts @user.uid
#       puts @user.name
#       puts @user.login
#       puts @user.token
#       puts "after nil*********"
#       client.check_application_authorization(@user.token)
#   end
#   end
# end
