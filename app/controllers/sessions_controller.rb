class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]
  def create
    @user = AdminUser.find_by(name: params[:admin_user][:name].downcase)

    respond_to do |format|
      if @user&.authenticate(params[:admin_user][:password])
        login @user
        format.html { redirect_to dashboard_path, notice: 'You have successfully logged in.' }
      else
        flash.now[:notice] = 'Invalid name or password.'
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Signed out.'
  end

  def new
  end
end
