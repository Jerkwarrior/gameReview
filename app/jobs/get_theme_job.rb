class GetThemeJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    game = Game.find(igdb_id)
    ig.themes&.each do |theme_id|
      ig_theme = Igdb::Theme.find(theme_id)
      theme = Theme.find_or_create_by(id: theme_id)
      theme.name = ig_theme.name
      theme.save!
      game.themes << theme
    end
  end
end
