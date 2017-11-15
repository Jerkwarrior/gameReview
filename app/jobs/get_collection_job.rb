class GetCollectionJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    return if ig.collection.blank?
    ig_collection = Igdb::Collection.find(ig.collection)
    Collection.find_or_create_by(id: ig_collection.id, name: ig_collection.name, slug: ig_collection.slug)
  end

end
