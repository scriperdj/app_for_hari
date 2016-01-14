class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  ENV['RECAPTCHA_PUBLIC_KEY']  = '6LcVVhUTAAAAAKqABNx6QIuFywCnEJthLRkrTcUe'
  ENV['RECAPTCHA_PRIVATE_KEY'] = '6LcVVhUTAAAAABvNOMthxdlw4wm4TaMMjvN_C0in'

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def admin_check
    unless current_user.admin?
      sign_out_and_redirect(current_user)
    end
  end
end
