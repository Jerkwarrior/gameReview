class GetGenreJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    game = Game.find(igdb_id)
    ig.genres&.each do |genre_id|
      ig_genre = Igdb::Genre.find(genre_id)
      genre = Genre.new(id: genre_id)
      genre.name = ig_genre.name
      genre.save!
      game.genres << genre
    end
  end
end
