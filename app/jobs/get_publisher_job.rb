class GetPublisherJob < ApplicationJob
  queue_as :default

  def perform(igdb_id)
    company = Igdb::Company.find(igdb_id)
    company.published&.each do |game_id|
      next if game_id.blank?
      Publisher.find_or_create_by(company_id: igdb_id, game_id: game_id)
    end
  end
end
