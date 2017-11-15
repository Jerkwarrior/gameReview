class GetFranchiseJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    ig = Igdb::Game.find(igdb_id)
    return if ig.franchise.blank?
    ig_franchise = Igdb::Franchise.find(ig.franchise)
    Franchise.find_or_create_by(id: ig_franchise.id, name: ig_franchise.name, slug: ig_franchise.slug)
  end

end
