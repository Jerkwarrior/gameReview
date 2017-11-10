class GetDeveloperJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    company = Igdb::Company.find(igdb_id)
    company.developed&.each do |game_id|
      next if game_id.blank?
      Developer.find_or_create_by(company_id: igdb_id, game_id: game_id)
    end
  end
end
