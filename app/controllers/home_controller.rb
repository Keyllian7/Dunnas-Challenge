class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @message = "Hello, World!"
  end

  def dashboard
    @message = "Welcome to the dashboard!"
  end

end
