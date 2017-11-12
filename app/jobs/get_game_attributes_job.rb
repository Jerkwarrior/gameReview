class GetGameAttributesJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    game = Game.find(igdb_id)

    ig.game_engines&.each do |engine|
      game.game_engines << GameEngine.find(engine)
    end

    ig.game_modes&.each do |mode|
      game.game_modes << GameMode.find(mode)
    end

    ig.genres&.each do |genre|
      game.genres << Genre.find(genre)
    end

    ig.keywords&.each do |keyword|
      game.keywords << Keyword.find(keyword)
    end

    ig.themes&.each do |theme|
      game.themes << Theme.find(theme)
    end

    ig.release_dates&.each do |date|
      game.platforms << Platform.find(date.platform)
    end

  game.save!
  
  end
end
