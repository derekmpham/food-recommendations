class UsersController < ApplicationController
  
  include SessionsHelper

  # def index
  # 	@users = User.all
  # end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	@user.password = params[:user][:password_hash]
    @recommendations = Recommendation.all
  	if @user.save
  	  session[:user_id] = @user.id
  	  redirect_to "/users/#{@user.id}/recommendations"
  	else
  	  redirect_to '/users/new'
  	end
  end

  # def show
  #   @user = User.find(params[:id])
  #   @recommendations = Recommendation.all
  # end

  private

  def user_params
  	params.require(:user).permit(:email, :username, :password_hash)
  end
end
