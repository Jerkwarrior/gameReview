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
      GetGameEngineJob.perform_now(engine)
      game.game_engines << GameEngine.find(engine)
    end

    ig.game_modes&.each do |mode|
      GetGameModeJob.perform_now(mode)
      game.game_modes << GameMode.find(mode)
    end

    ig.genres&.each do |genre|
      GetGenreJob.perform_now(genre)
      game.genres << Genre.find(genre)
    end

    ig.keywords&.each do |keyword|
      GetKeywordJob.perform_now(keyword)
      game.keywords << Keyword.find(keyword)
    end

    ig.themes&.each do |theme|
      GetThemeJob.perform_now(theme)
      game.themes << Theme.find(theme)
    end

    ig.release_dates&.each do |date|
      GetPlatformJob.perform_now(date.platform)
      game.platforms << Platform.find(date.platform)
    end

    ig.screenshots&.each do |image|
      img = Image.new(game_id: igdb_id, url: image.url)
      img.save!
      # game.images << Image.where(id: img.id)
    end

    ig.videos&.each do |video|
      vid = Video.new(game_id: igdb_id, name: video.name, youtube_slug: video.video_id)
      vid.save!
      # game.videos << Video.find(id: vid.id)
    end

    game.save!

  end
end
