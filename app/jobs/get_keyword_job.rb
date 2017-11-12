class GetKeywordJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    game = Game.find(igdb_id)
    ig.keywords&.each do |keyword_id|
      ig_keyword = Igdb::Keyword.find(keyword_id)
      Keyword.find_or_create_by(id: keyword_id, name: ig_keyword.name)
      game.keywords << keyword
    end
  end
end
