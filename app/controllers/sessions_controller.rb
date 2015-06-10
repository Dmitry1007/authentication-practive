class SessionsController < ApplicationController
  def new
  end

  def create
      # byebug
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user # user_path(@user)
    else
      # either user doesn't exist or password is incorrect
    end
  end
end