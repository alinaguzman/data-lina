class SessionsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.new(admin_params)
    if admin.login_valid?
      session[:admin_id] = true
      redirect_to root_url, notice: 'Logged in'
    else
      redirect_to login_path, notice: 'Invalid'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end

end