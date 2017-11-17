class GetPerspectiveJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    game = Game.find(igdb_id)
    ig.player_perspectives&.each do |persp_id|
      ig_persp = Igdb::PlayerPerspective.find(persp_id)
      persp = Perspective.find_or_create_by(id: persp_id)
      persp.name = ig_persp.name
      persp.save!
      game.perspectives << persp
    end
  end

end
