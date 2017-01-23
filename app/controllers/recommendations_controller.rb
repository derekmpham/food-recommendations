class RecommendationsController < ApplicationController
  
  include SessionsHelper, GmapsHelper

  def index
    # recent_media = Instagram.tag_recent_media('fashion')
    @user = User.find(params[:user_id])
    @recommendations = Recommendation.all
    @recommendation = Recommendation.new
    # response = Instagram.get_access_token(params[:code], :redirect_uri => "https://api.instagram.com/v1/tags/nofilter/media/recent?access_token=ACCESS_TOKEN")
    # session[:access_token] = response.access_token
    # @insta_client = Instagram.client(:access_token => session[:access_token])
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
    params.require(:recommendation).permit(:name, :cuisine, :city, :description, :address)
  end
end
