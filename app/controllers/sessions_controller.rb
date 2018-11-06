class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      log_in user
      #remember user
      redirect_to '/'
  	else
  		flash.now[:danger] = "mots de passe/email invalide"
  		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to '/login'
  end
end

