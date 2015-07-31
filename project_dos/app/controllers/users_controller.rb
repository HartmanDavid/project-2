class UsersController < ApplicationController
    before_action :authorize, only: :index
  def new
        @user = User.new
  end
  def index
      @users = User.all
  #
    if session[:user_id]
      @pets = Pet.all
    end
  end
  def create
      @user = User.new user_params
      if @user.save
          flash[:notice]= "Welcome #{@user.email}, you are logged in!"
          redirect_to users_path
      else
          flash[:notice]= "Attempt unsuccessful. Please log in."
          render 'new'
      end
  end

  private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
