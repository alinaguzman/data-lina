class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    unless session[:admin_id]
      redirect_to '/login', notice: 'Admin required'
    end
  end

  private

  def logged_in?
    session[:admin_id]
  end

  helper_method :logged_in?

end
