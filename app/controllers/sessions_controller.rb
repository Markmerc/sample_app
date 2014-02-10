class SessionsController < ApplicationController
  def new
    sign_out
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/passsword combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
