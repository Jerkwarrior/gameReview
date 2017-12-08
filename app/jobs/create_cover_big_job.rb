class CreateCoverBigJob < ApplicationJob

  def perform(game_id)
    game = Game.find(game_id)
    game.cover_big = game.cover_url.gsub(/t_thumb/, 't_cover_big')
    game.save!
  end

end
