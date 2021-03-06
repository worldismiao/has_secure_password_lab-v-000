class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by(name: params[:user][:name])
   authenticated = user.try(:authenticate, params[:user][:password])
   return redirect_to controller: 'sessions', action: 'new'  unless authenticated
   @user = user
   session[:user_id] = @user.id
   redirect_to controller: 'users', action: 'show'
 end
end
