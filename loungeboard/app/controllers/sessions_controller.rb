
class SessionsController < ApplicationController
  def create
    if @user = User.authenticate(params[:name], params[:password])
      session[:user_id] = @user.id
      
      respond_to do |format|
        format.html { redirect_to root_path, :notice => "Logged in successfully"}
        format.json { render :json => @user, :status => :created }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }     # render new.html.erb
        format.json { render :json => @user.errors, :status => :unprocessable_entity}              
      end
    end
    
  end
  
  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end
end
