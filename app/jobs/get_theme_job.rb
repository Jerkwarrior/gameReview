class GetThemeJob < ApplicationJob

  def perform(igdb_id)
    return if Theme.where(id: igdb_id).exists?
    ig = Igdb::Theme.find(igdb_id)
    theme = Theme.new(id: igdb_id)
    theme.name = ig.name
    theme.save!
  end
end
