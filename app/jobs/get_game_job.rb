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
    game.franchise = ig.franchise
    game.collection = ig.collection
    game.popularity = ig.popularity # TODO Should be float
    game.category = ig.category
    game.status = ig.status
    game.cover_url = ig.cover&.url #This is thumb, needs to be cover_big
    game.release_date_human = ig.release_dates&.first&.human
    # TODO pegi_rating, steam_id, not part of gem?

    ig.game_engines&.each do |engine|
      GetGameEngineJob.perform_later(engine)
    end

    ig.game_modes&.each do |mode|
      GetGameModeJob.perform_later(mode)
    end

    ig.genres&.each do |genre|
      GetGenreJob.perform_later(genre)
    end

    ig.keywords&.each do |keyword|
      GetKeywordJob.perform_later(keyword)
    end

    ig.themes&.each do |theme|
      GetThemeJob.perform_later(theme)
    end

    ig.release_dates&.each do |date|
      GetPlatformJob.perform_later(date.platform)
    end

    ig.screenshots&.each do |image|
      img = Image.new(game_id: igdb_id, url: image.url)
      img.save!
    end

    ig.videos&.each do |video|
      vid = Video.new(game_id: igdb_id, name: video.name, youtube_slug: video.video_id)
      vid.save!
    end

    GetGameAttributesJob.perform_later(igdb_id)

    game.save!

  end
end
