class RecommendationsController < ApplicationController
  
  include SessionsHelper

  def index
    @user = User.find(params[:user_id])
    @recommendations = Recommendation.all
    @recommendation = Recommendation.new
  end

  def create
    @user = current_user
    @recommendation = Recommendation.new(recommendation_params.merge(user_id: @user.id))

    respond_to do |format|
      if @recommendation.save
        format.js {}
        format.json { render json: @recommendation }
        # format.html { redirect_to @recommendation, notice: 'Recommendation was successfully created.' }
        # format.json { render :show, status: :created, location: @recommendation }
      else
        format.js { render :error, status: 422 }
        # format.html { render :new }
        # format.json { render json:@recommendation.errors, status: :unprocessable_entity }
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
  end

  def destroy
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:name, :cuisine, :location, :description)
  end
end
