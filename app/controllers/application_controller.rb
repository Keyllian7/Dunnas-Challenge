class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do
    redirect_to root_path, alert: 
    "You are not authorized to access this page."
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
