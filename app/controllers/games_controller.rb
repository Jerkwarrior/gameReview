class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def index
    @games = Game.all
  end

  def show
    render :json => @game, :include => [{:platforms => {only: :name}},
                                        {:genres => {only: :name}},
                                        {:franchise => {only: :name}},
                                        {:keywords => {only: :name}},
                                        {:game_modes => {only: :name}},
                                        {:perspectives => {only: :name}},
                                        {:themes => {only: :name}},
                                        {:game_engines => {only: :name}},
                                        {:collection => {only: :name} }]
  end


  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :slug, :url, :summary, :popularity, :game, :category, :status, :release_date_human, :cover_url, :franchise_id, :collection_id )
    end

end
