class WebController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_admin!, only: [:dashboard]

  def index
  end

  def dashboard
    @users = User.all
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
  end
end