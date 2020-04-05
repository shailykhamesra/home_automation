class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  around_action :switch_locale
 
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end


  private

  def confirm_logged_in
    unless session[:user_id]
        flash[:notice] = "#{I18n.t 'login.info'}"
        redirect_to(login_login_path)
    end
  end
  
end
