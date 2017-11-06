class GetGameModeJob < ApplicationJob

  def perform(igdb_id)
    return if GameMode.where(id: igdb_id).exists?
    ig = Igdb::GameMode.find(igdb_id)
    mode = GameMode.new(id: igdb_id)
    mode.name = ig.name
    mode.save!
  end
end
