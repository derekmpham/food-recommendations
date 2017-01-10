class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
  	@user = User.find_by_username(params[:username])
  	if @user && @user.password == params[:password]
  	  login(@user)
  	  redirect_to '/users/#{@user.id}'
  	else
  	  redirect_to '/login'
  	end
  end

  def destroy
  	logout
  	redirect_to '/'
  end
end
