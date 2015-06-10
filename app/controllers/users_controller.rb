class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    # we create helper method because we don't just want
    # to know what user is logged in on the show page but
    #throughout the site
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user #user_path(@user)
    else
      # if user is not saved
      # re-render :new if validations don't pass
      flash.now[:errors] = @user.errros.full_messages.join(", ")
      render :new
    end
    #when a user creates an account they should automatically
    #be logged in, so we keep track of the user_id in a session
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end