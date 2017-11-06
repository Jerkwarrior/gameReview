class GetGameEngineJob < ApplicationJob

  def perform(igdb_id)
    return if GameEngine.where(id: igdb_id).exists?
    ig = Igdb::GameEngine.find(igdb_id)
    engine = GameEngine.new(id: igdb_id)
    engine.name = ig.name
    engine.save!
  end
end
