class SessionsController < ApplicationController
  def new
    logged_in_notice if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      #..
      log_in(user)
      flash[:success] = "Welcome #{user.name} !"
      redirect_to user
    else
      flash.now[:danger] = 'Email and password miss match'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    redirect_to root_path
  end
end
