class RecommendationsController < ApplicationController
  
  include SessionsHelper

  def index
    @user = User.find(params[:user_id])
    @recommendations = Recommendation.all
    @recommendation = Recommendation.new
    @insta_client = Instagram.client(:access_token => session[:access_token])
  end

  def create
    @user = current_user
    @recommendation = Recommendation.new(recommendation_params.merge(user_id: @user.id))

    respond_to do |format|
      if @recommendation.save
        format.js {}
        # format.json { render json: @recommendation }
      else
        format.js { render :error, status: 422 }
      end
    end
  end

  # GET /posts/new
  # def new
  #   @recommendation = Recommendation.new
  # end

  def edit
  end

  # show individual recommendation
  def show
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    respond_to do |format|
      if @recommendation.update(recommendation_params)
        format.js {}
      else
        format.js { render :error, status: 422 }
      end
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    respond_to do |format|
      if @recommendation.user_id == current_user.id
        @recommendation.destroy
        format.js {}
        # format.json { render json: @recommendation }
      else
        format.js { render :error, status: 422 }
      end
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:name, :cuisine, :location, :description)
  end
end
