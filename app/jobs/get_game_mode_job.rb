class GetGameModeJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    game = Game.find(igdb_id)
    ig.game_modes&.each do |mode_id|
      ig_mode = Igdb::GameMode.find(mode_id)
      mode = GameMode.new(id: mode_id)
      mode.name = ig_mode.name
      mode.save!
      game.game_modes << mode
    end
  end
end
