class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice:  "Hi #{user.email}! You are logged in."
        else
            flash.now.alert = 'Incorrect email and password. You are not logged in.'
            render 'new'
        end
  end

  def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "You have been logged out"
  end
end
