class GetGameJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Game.where(id: igdb_id).exists?
    ig = Igdb::Game.find(igdb_id)
    game = Game.new(id: igdb_id)
    game.name = ig.name
    game.slug = ig.slug
    game.summary = ig.summary
    game.franchise = ig.franchise
    game.popularity = ig.popularity # TODO Should be float
    # TODO game needs to be done ith dlc, expansion, etc.
    game.category = ig.category
    game.status = ig.status
    game.cover_url = ig.cover.url
    game.release_date_human = ig.release_dates.first.human
    # TODO pegi_rating, steam_id
    game.save!
  end

end
