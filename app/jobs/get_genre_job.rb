class GetGenreJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Genre.where(id: igdb_id).exists?
    ig = Igdb::Genre.find(igdb_id)
    genre = Genre.new(id: igdb_id)
    genre.name = ig.name
    genre.save!
  end
end
