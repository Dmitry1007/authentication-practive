class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user # user_path(@user)
    else
      # either user doesn't exist or password is incorrect
      flash.now[:errors] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear  # or session[:user_id] = nil
    redirect_to login_path
  end
end