class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::InvalidForeignKey, with: :handle_foreign_key_violation
  rescue_from ActiveRecord::NotNullViolation, with: :handle_not_null_violation
  rescue_from CanCan::AccessDenied do
    redirect_to root_path, alert:
    "You are not authorized to access this page."
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def handle_foreign_key_violation(exception)
    redirect_back(fallback_location: root_path, alert: "This record cannot be deleted because it is being referenced by other records.")
  end

  def handle_not_null_violation(exception)
    redirect_back(fallback_location: root_path, alert: "A required field is missing.")
  end

end
