class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_filter :set_locale
  
 # def set_locale
  #  I18n.locale = params[:locale]
  #end


  private

  def confirm_logged_in
    unless session[:user_id]
        flash[:notice] = "Please Log In"
        redirect_to(login_login_path)
    end
  end
  
end
