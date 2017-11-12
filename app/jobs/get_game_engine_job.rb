class GetGameEngineJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    game = Game.find(igdb_id)
    ig.game_engines&.each do |eng|
      ig_eng = Igdb::GameEngine.find(eng)
      engine = GameEngine.find_or_create_by(id: eng)
      engine.name = ig_eng.name
      engine.logo_url =  ig_eng.logo&.url
      engine.save!
      game.game_engines << engine
    end
  end
end
