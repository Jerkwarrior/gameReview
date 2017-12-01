class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def index
    @games = Game.all
  end

  def show
  end


  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :slug, :url, :summary, :collection_id, :franchise_id, :popularity, :game, :category, :status, :release_date_human, :cover_url )
    end

end
