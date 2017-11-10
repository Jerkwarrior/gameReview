class GetPlatformJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    return if Platform.where(id: igdb_id).exists?
    ig = Igdb::Platform.find(igdb_id)
    platform = Platform.new(id: igdb_id)
    platform.name = ig.name
    platform.logo_url = ig.logo&.url
    platform.save!
  end
end
