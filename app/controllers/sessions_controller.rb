class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
  	@user = User.find_by_username(params[:username])
  	if @user && @user.authenticate(params[:password])
  	  login(@user)
  	  redirect_to "/users/#{@user.id}/recommendations"
  	else
  	  redirect_to '/login'
  	end
  end

  def destroy
  	logout
  	redirect_to '/'
  end
end
