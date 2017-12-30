class GetPlatformJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    game = Game.find(igdb_id)
    ig.release_dates&.each do |date|
      plat_id = date.platform
      ig_platform = Igdb::Platform.find(plat_id)
      platform = Platform.find_or_create_by(id: plat_id)
      platform.name = ig_platform.name
      platform.logo_url = ig_platform.logo&.url
      platform.save!
      return if game.platforms.exists?(id: plat_id)
      game.platforms << platform
    end
  end
end
