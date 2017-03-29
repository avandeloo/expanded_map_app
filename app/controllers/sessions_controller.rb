class SessionsController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    if params[:Submit]
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = 'Successfully Logged In'
        redirect_to '/'
      else
        flash[:warning] = 'Invalid Email Or Password'
        redirect_to '/login'
      end
    elsif params[:Signup]
      redirect_to '/signup'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully Logged Out'
    redirect_to '/login'
  end

end
