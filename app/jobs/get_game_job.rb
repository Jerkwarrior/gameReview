class GetGameJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Game.where(id: igdb_id).exists?
    begin
      ig = Igdb::Game.find(igdb_id)
    rescue NoMethodError
      return
    end

    game = Game.new(id: igdb_id)
    game.name = ig.name
    game.slug = ig.slug
    game.summary = ig.summary
    game.franchise_id = ig.franchise
    game.collection_id = ig.collection
    game.popularity = ig.popularity
    game.category = ig.category
    game.status = ig.status
    game.cover_url = ig.cover&.url
    game.release_date_human = ig.release_dates&.first&.human

    ig.screenshots&.each do |image|
      img = Image.new(game_id: igdb_id, url: image.url)
      img.save!
    end

    ig.videos&.each do |video|
      vid = Video.new(game_id: igdb_id, name: video.name, youtube_slug: video.video_id)
      vid.save!
    end

    game.save!

    GetKeywordJob.perform_later(igdb_id)
    GetGameEngineJob.perform_later(igdb_id)
    GetGameModeJob.perform_later(igdb_id)
    GetGenreJob.perform_later(igdb_id)
    GetPlatformJob.perform_later(igdb_id)
    GetThemeJob.perform_later(igdb_id)
    GetFranchiseJob.perform_later(igdb_id)
    GetCollectionJob.perform_later(igdb_id)
    GetPerspectiveJob.perform_later(igdb_id)
  end
end
