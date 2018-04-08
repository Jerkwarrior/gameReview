class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_game
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def game_params
    params.require(:game).permit(:name, :slug, :url, :summary, :popularity,
                                 :game, :category, :status, :release_date_human,
                                 :cover_url, :franchise_id, :collection_id)
  end

  def review_params
    params.require(:review).permit(:summary, :gameplay, :story, :graphics, :immersion,
                                   :recommended?, :bugs?, :microtransactions?).merge(game: @game, user: current_user)
  end
end
