class ApplicationController < ActionController::Base
  around_action :catch_not_found
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_cook

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def set_cook
    cookies[:test] = {value: 'test'}
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'muss das sein?'
    redirect_to request.referrer || root_url
  end

  def require_household_user
    if !@household.users.include?(current_user)
      flash[:danger] = 'Im Ernst jetzt?'
      redirect_to root_url
    end
  end

end
