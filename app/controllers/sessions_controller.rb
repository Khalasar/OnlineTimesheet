class SessionsController < ApplicationController
  def new
  end

  def create  
    user = User.find_by_lastname(params[:lastname])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to timesheets_path,
      notice: "Erfolgreiches Log in."
    else
      flash.now.alert = "Fehlerhafter Name oder Passwort."
      render "new"
    end
  end

  def destroy   
    session[:user_id] = nil
    redirect_to root_path,
    notice: "Sie haben sich ausgeloggt."
  end
end
