class GetKeywordJob < ApplicationJob

  def perform(igdb_id)
    return if Keyword.where(id: igdb_id).exists?
    ig = Igdb::Keyword.find(igdb_id)
    keyword = Keyword.new(id: igdb_id)
    keyword.name = ig.name
    keyword.save!
  end

end
